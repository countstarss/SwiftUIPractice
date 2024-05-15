//
//  SpotifyRecentsCell.swift
//  SwiftUIPractice
//
//  Created by 王佩豪 on 2024/5/14.
//

import SwiftUI
import SwiftfulUI


struct SpotifyRecentsCell: View {
    
    var imageName :String = Constants.randomImage
    var title : String = "Some title textSome title textSome title text"
    
    var body: some View {
        HStack{
            ImageLoaderView(urlString: imageName, resizingMode: .fill)
                .frame(width: 55, height:55)
            
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2)
                .foregroundColor(.spotifyWhite)
//                .background(.red)
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .themeColors(isSelected: false)
        .cornerRadius(6)
    }
}

#Preview {
    ZStack{
        Color.spotifyBlack.ignoresSafeArea()
        
        VStack{
            HStack{
                SpotifyRecentsCell()
                SpotifyRecentsCell()
            }
            HStack{
                SpotifyRecentsCell()
                SpotifyRecentsCell()
            }
            HStack{
                SpotifyRecentsCell()
                SpotifyRecentsCell()
            }
        }
    }
}
