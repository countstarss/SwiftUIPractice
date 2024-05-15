//
//  SpotifyPlaylistView.swift
//  SwiftUIPractice
//
//  Created by 王佩豪 on 2024/5/15.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct SpotifyPlaylistView: View {
    
    var product : Product = .mock
    var user : User = .mock
    
    @State private var products : [Product] = []
    @State private var showHeader : Bool = false
    @Environment(\.router) var router
    
    @State var viewState :CGSize = .zero
    
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ScrollView(.vertical){
                LazyVStack{
                    PlayListHeaderCell(
                        height: 250,
                        title: product.title,
                        subTitle: product.brand,
                        imageName: product.thumbnail
                    )
                    .readingFrame { frame in

                        showHeader = frame.minY < -160 ? true : false
                    }
                    
                    // 换用SwiftfulUI
//                    .overlay(
//                        GeometryReader(content: { geometry in
//                            Text("")
//                                .frame(maxWidth: .infinity,maxHeight: .infinity)
//                                .background(.red)
//                        })
//                    )
                    PlaylistDescriptionCell(
                        userName: user.lastName
                    )
                    .padding(.horizontal)
                    
                    ForEach(products) { product in
                        SongRowCell(
                            title: product.title,
                            brand: product.brand,
                            imageSzie: 50,
                            imageName: Constants.randomImage,
                            onCellPressed: {
                                goToPlayListView(product : product)
                            },
                            onEllipsisPressed: {}
                        )
                        .padding(.horizontal)
                        .asButton {
                            
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .gesture(
                DragGesture(minimumDistance: 30, coordinateSpace: .local).onChanged{ value in
                    guard value.translation.width > 0 else { return }
                    
                    if value.startLocation.x < 100{
                        withAnimation {
                            viewState = value.translation
                        }
                    }
                    
                    if viewState.width > 120 {
                    }
                }
                .onEnded{value in
                    if viewState.width > 80 {
                        
                    }else{
                            viewState = .zero
                    }
                    
                }
                    
                
            )
            
            navigator
                .animation(.smooth(duration: 0.2),value: showHeader)
            
        }.task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
        
        
        
    }
    
    private func getData() async {
        do{
            products = try await DatabaseHelper().getProducts()

        }catch{
            
        }
    }
    private var navigator :some View {
        ZStack {
            Text("Title")
                .font(.headline)
                .padding(.vertical,20)
                .frame(maxWidth: .infinity)
                // 营造出文字从上到下出现的效果
                .offset(y: showHeader ? 0 : -50)
                .opacity(showHeader ? 1 : 0)
            
            // 返回按钮不管什么情况总是显示的
            Image(systemName: "chevron.left")
                .font(.title3)
                .padding(12)
                .foregroundStyle(.spotifyWhite)
                .background(.spotifyDarkGray.opacity(0.6))
                .clipShape(Circle())
                .onTapGesture {
                    router.dismissScreen()
                }
                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment:.topLeading)
                .padding(.leading)
            
        }
        .foregroundColor(.spotifyWhite)
        .frame(height: 60)
        .background(.spotifyDarkGray.opacity(showHeader ? 1 : 0))
        .frame( maxHeight: .infinity,alignment: .top)
    }
    
    private func goToPlayListView(product : Product) {
        
        router.showScreen(.push) {_ in
            SpotifyPlaylistView(product: product, user: user, viewState: .zero)
        }
    }
    
    
    var drag :some Gesture {
        DragGesture(minimumDistance: 30, coordinateSpace: .local).onChanged{ value in
            //添加守卫 滑动值必须为正,也就是右滑,否则不做反应
            guard value.translation.width > 0 else { return }
            
            if value.startLocation.x < 100{
                withAnimation {
                    viewState = value.translation
                }
            }
            
            if viewState.width > 120 {
            }
        }
        .onEnded{value in
            if viewState.width > 80 {
                
            }else{
                    viewState = .zero
            }
            
        }
    }
}

#Preview {
    RouterView{_ in 
        SpotifyPlaylistView(viewState: .zero)
    }
}
