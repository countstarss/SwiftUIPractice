//
//  ImageLoaderView.swift
//  SwiftUIPractice
//
//  Created by 王佩豪 on 2024/5/14.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    var urlString = Constants.randomImage
    var resizingMode : ContentMode = .fill
    
    var body: some View {
        
        Rectangle()
            .overlay(
                WebImage(url: URL(string: urlString))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizingMode)
            )
        //类似于蒙版,只显示Rectangle区域范围
            .clipped()

    
    }
}

#Preview {
    ImageLoaderView()
        .cornerRadius(30)
        .padding(20)
        .padding(.vertical,60)
}
