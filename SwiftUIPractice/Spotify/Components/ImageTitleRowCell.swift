//
//  ImageTileRowCell.swift
//  SwiftUIPractice
//
//  Created by 王佩豪 on 2024/5/15.
//

import SwiftUI
import SwiftfulUI

struct ImageTitleRowCell: View {
    
    var imageSize :CGFloat = 100
    var imageName:String = Constants.randomImage
    var title :String = "Some title"
    
    var body: some View {
        VStack (alignment:.leading){

                ImageLoaderView(urlString: imageName)
                    .frame(width: imageSize,height: imageSize)
                    .cornerRadius(10)
                Text(title)
                    .font(.callout)
                    .frame(maxWidth: imageSize)
                    .lineLimit(2)
            }
            .scrollIndicators(.hidden)
        }
}

#Preview {
    
    ZStack {
        Color.black.ignoresSafeArea()
        ImageTitleRowCell()
    }
}
