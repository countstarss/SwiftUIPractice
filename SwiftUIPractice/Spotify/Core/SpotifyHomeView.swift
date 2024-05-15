//
//  SpotifyHomeView.swift
//  SwiftUIPractice
//
//  Created by 王佩豪 on 2024/5/14.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct SpotifyHomeView: View {
    
    @State private var currentUser:User? = nil
    @State private var selectedCategory : Category? = nil
    @State private var products : [Product] = []
    @State private var productRows : [ProductRow] = []
    
    
    
//    @Environment(\.dismiss) var dismiss
    @Environment(\.router) var router
    
    
    var body: some View {
        ZStack{
            Color.spotifyBlack.ignoresSafeArea()

            ScrollView{
                LazyVStack(spacing:24,pinnedViews: [.sectionHeaders]) {
                    Section {
                        
                        rencentSection
                            .padding(.horizontal,16)
                            .frame(width: .infinity,height: 240)
                        if let product = products.first{
                            newRelesaeSection(product: product)
                        }
                    } header: {
                        header
                    }
                    
                    listRow

                }
            }
            .scrollIndicators(.hidden)
            .clipped()
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
        
    }
    private func getData() async {
        // 如果products为空,重新加载,如果已经有了,那就不重新加载
        guard products.isEmpty else {return}
        do{
            currentUser = try await DatabaseHelper().getUsers().first
            products = try await Array(DatabaseHelper().getProducts().prefix(8))
            
            // 下面代码的目的是从获取的数据中提取出想要的"productRows"数据结构
            var rows : [ProductRow] = []
            // Set集合不能有重复值
            let allBrands = Set(products.map({$0.brand}))
            for brand in allBrands{
                let products = self.products.filter({$0.brand == brand})
                rows.append(ProductRow(title: brand.capitalized, products: products))
            }
            productRows = rows
        }catch{
            
        }
    }
    
    private var header :some View {
        HStack{
            ZStack{
                if let currentUser{
                    ImageLoaderView(urlString: currentUser.image)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
//                            dismiss()
                            //使用 router 的方法
                            router.dismissScreen()
                        }
                        
                }
            }
            .frame(width: 40,height: 40)
            .background(.spotifyWhite)
            .clipShape(Circle())
            
            ScrollView(.horizontal){
                HStack(spacing: 8){
                    ForEach(Category.allCases,id:\.self){ category in
                        SpotifyCategoryCell(
                            title: category.rawValue.capitalized,
                            isSelected: category == selectedCategory ? true : false
                        )
                        .foregroundColor(.spotifyGreen)
                        .onTapGesture {
                            selectedCategory = category
                        }
                    }
                    
                }
                .padding(.horizontal,8)
            }
            .scrollIndicators(.hidden)
            
        }
        .padding(.vertical,15)
        .padding(.leading,8)
        .background(.spotifyBlack)
    }
 
    private var rencentSection:some View {
        NonLazyVGrid(columns: 2,alignment: .center,spacing:10, items: products) { product in
            if let product {
                SpotifyRecentsCell(
                    imageName: product.firstImage,
                    title: product.title
                )
                // asButton是SwiftfulUI中的API
                .asButton(.press) {
                    goToPlayListView(product: product)
                }
            }
        }
    }
    private func goToPlayListView(product : Product) {
        
        guard let currentUser else {return}
        router.showScreen(.push) {_ in
            SpotifyPlaylistView(product: product, user: currentUser, viewState: .zero)
        }
    }
    
    private func newRelesaeSection(product: Product) -> some View {
        SpotifyNewReleaseCell(
            imageName: product.firstImage,
            headline: product.brand,
            subheadline: product.category,
            onAddToPlayListPressed :{
                goToPlayListView(product: product)
            },
            onPlayPressed: {
                goToPlayListView(product: product)
            })
    }
    
    private var listRow :some View {
        VStack {
            ForEach(productRows){ row in
                VStack(alignment:.leading,spacing:16){
                    Text(row.title)
                        .font(.title2.weight(.bold))
                        .lineLimit(1)
//                                    .background(.spotifyGreen)
                        .padding(.horizontal)
                    ScrollView(.horizontal){
                        HStack(spacing:16){
                            ForEach(products) { product in
                                ImageTitleRowCell(
                                    imageSize: 120,
                                    imageName: product.firstImage,
                                    title: product.title
                                )
                                .asButton(.press) {
                                    goToPlayListView(product: product)
                                }
                            }
                                
                        }
                        .padding(.horizontal)
                        
                    }
                    .scrollIndicators(.hidden)
//                                .padding(.horizontal)
                }

            }
        }
    }
}

#Preview {
    RouterView{ _ in
        SpotifyHomeView()
    }
}
