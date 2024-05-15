//
//  PlayListHeader.swift
//  SwiftUIPractice
//
//  Created by 王佩豪 on 2024/5/15.
//

import SwiftUI

struct PlayListHeaderCell: View {
    
    var height:CGFloat = 300
    var title :String = "this is a title title"
    var subTitle :String = " this is a subTitle"
    var imageName :String = Constants.randomImage
    var shadowColor :Color = .spotifyBlack.opacity(0.7)
    
    var body: some View {
        
        Rectangle()
            .opacity(0)
            .overlay(ImageLoaderView(urlString: imageName))
            .overlay(
                VStack(alignment:.leading,spacing:8){
                    Text(subTitle)
                        .font(.headline)
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .foregroundStyle(.spotifyWhite)
                .padding()
                .frame(maxWidth: .infinity,alignment: .leading)
                .background(LinearGradient(colors: [shadowColor.opacity(0),shadowColor.opacity(1)], startPoint: .top, endPoint: .bottom))
                ,alignment: .bottomLeading
            )
            // 直接成为可以可以拉伸的Header
            .asStretchyHeader(startingHeight: height)
            .frame(height: 300)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        ScrollView {
            PlayListHeaderCell()
        }
        .ignoresSafeArea()
    }
}
