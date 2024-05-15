//
//  SpotifyNewReleaseCell.swift
//  SwiftUIPractice
//
//  Created by 王佩豪 on 2024/5/14.
//

import SwiftUI

struct SpotifyNewReleaseCell: View {
    
    var imageName :String = Constants.randomImage
    var headline :String? = "Recent Release"
    var subheadline :String? = "Talyar Swift"
    var title :String? = "The most Famous Singing Star!"
    var subtitle:String? = "Single - title"
    var onAddToPlayListPressed : (() -> Void )? = nil
    var onPlayPressed : (() -> Void )? = nil
    
    var body: some View {
        VStack {
            // top
            HStack(spacing:16){
                ImageLoaderView(urlString: imageName)
                    .frame(width: 50,height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading,spacing:4){
                    if let headline {
                        Text(headline)
                            .foregroundStyle(.spotifyLightGray)
                            .font(.callout)
                    }
                    if let subheadline{
                        Text(subheadline)
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundStyle(.spotifyWhite)
                    }
                }
    //            .background(.spotifyGreen)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding()
            
            // bottom
            HStack(alignment: .top){
                ImageLoaderView()
                    .frame(width: 140,height: 140,alignment: .leading)
                    .cornerRadius(10)
                VStack(alignment:.leading){
                    if let title {
                        Text(title)
                            .font(.title3)
                            .foregroundStyle(.spotifyWhite)
                    }
                    if let subtitle{
                        Text(subtitle)
                            .font(.callout)
                            .fontWeight(.semibold)
                            .foregroundStyle(.spotifyLightGray)
                    }
                    Spacer()
                    HStack(alignment:.bottom){
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.spotifyWhite)
                            .font(.title2)
                            .padding(4)
//                            .background(.blue)
                            .onTapGesture {
                                onAddToPlayListPressed?()
                            }
                        
                        Spacer()
                        Image(systemName: "play.circle")
                            .foregroundStyle(.spotifyWhite)
                            .font(.title2)
                            .padding(4)
//                            .background(.blue)
                            .onTapGesture {
                                onPlayPressed?()
                            }
                    }
                }
                .padding(10)

                .background(.spotifyDarkGray)
                .cornerRadius(10)
                .onTapGesture {
                    onPlayPressed?()
                }
            }
            .padding()
            .frame(height: 170)
//            .background(.spotifyLightGray)
            .frame(maxWidth: .infinity,alignment: .leading)
        }
        
        
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        SpotifyNewReleaseCell()
            .padding(.trailing,20)
    }
}
