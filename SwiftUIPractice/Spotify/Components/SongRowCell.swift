//
//  SongRowCell.swift
//  SwiftUIPractice
//
//  Created by 王佩豪 on 2024/5/15.
//

import SwiftUI

struct SongRowCell: View {
    
//    var title : String = Product.mock.title
//    var brand :String = Product.mock.brand
    var title : String = "Title"
    var brand :String = "Brand"
    var imageSzie : CGFloat = 60
    var imageName : String = Constants.randomImage
    var onCellPressed : (() -> Void)? = nil
    var onEllipsisPressed : (() -> Void)? = nil
    
    var body: some View {
        
        HStack{
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSzie,height: imageSzie)
            VStack(alignment:.leading,spacing:4){
                Text(title)
                    .font(.title2)
                    .foregroundStyle(.spotifyWhite)
                    .lineLimit(1)
                Text(brand)
                    .font(.callout)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
            }
            .padding(.horizontal,4)
            
            .frame(maxWidth: .infinity,alignment: .leading)
//            .background(.blue)
            
            Spacer()
            Image(systemName: "ellipsis")
                .padding()
                .foregroundStyle(.spotifyWhite)
                .background(Color.clear.opacity(0.01))
                .onTapGesture {
                    onEllipsisPressed?()
                }
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .onTapGesture {
            onCellPressed?()
        }
//        .padding()
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        ScrollView {
            VStack {
                SongRowCell()
                SongRowCell()
                SongRowCell()
                SongRowCell()
            }
        }
    }
}
