//
//  PlaylistDescriptionView.swift
//  SwiftUIPractice
//
//  Created by 王佩豪 on 2024/5/15.
//

import SwiftUI

struct PlaylistDescriptionCell: View {
    
    var descriptionText : String = Product.mock.description
    var userName :String = "Nick"
    var subHeadline :String = "some headline gose here"
    
    var onAddToPlaylistPressed :(()-> Void)? = nil
    var onDownloadPressed :(()-> Void)? = nil
    var onSharePressed :(()-> Void)? = nil
    var onEllipsisPressed :(()-> Void)? = nil
    var onShufflePressed :(()-> Void)? = nil
    var onPlayPressed :(()-> Void)? = nil
    
    
    var body: some View {
        VStack(alignment:.leading,spacing: 8){
            Text(descriptionText)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity)
                .font(.headline)
                
            madeForYouSection
            
            Text(subHeadline)
                .foregroundStyle(.secondary)
            
            buttonsRow
                
            
            
            
        }

    }
    private var madeForYouSection :some View {
        HStack(spacing:8){
            Image(systemName: "applelogo")
                .font(.title3)
                .foregroundColor(.spotifyGray)
            
            Text("made for ")
            +
            Text(userName)
                .bold()
                .fontWeight(.semibold)
        }
    }
    
    private var buttonsRow :some View {
        HStack(spacing:0){
            HStack(spacing:2){
                Image(systemName: "plus.circle")
                    .padding(8)
                    .background(Color.black.opacity(0.01))
                    .onTapGesture {
                        onAddToPlaylistPressed?()
                    }
                Image(systemName: "arrow.down.circle")
                    .padding(8)
                    .background(Color.black.opacity(0.01))
                    .onTapGesture {
                        onDownloadPressed?()
                    }
                Image(systemName: "square.and.arrow.up")
                    .padding(8)
                    .background(Color.black.opacity(0.01))
                    .onTapGesture {
                        onSharePressed?()
                    }
                Image(systemName: "ellipsis")
                    .padding(8)
                    .background(Color.black.opacity(0.01))
                    .onTapGesture {
                        onEllipsisPressed?()
                    }
            }
            .offset(x:-8)
            
            Spacer()
            
            HStack(spacing:0){
                HStack(spacing:2){
                    Image(systemName: "shuffle")
                        .padding()
                        .background(Color.black.opacity(0.01))
                        .onTapGesture {
                            onShufflePressed?()
                        }
                    Image(systemName: "play.circle.fill")
                        .padding()
                        .background(Color.black.opacity(0.01))
                        .onTapGesture {
                            onPlayPressed?()
                        }
                    
                }
                .foregroundStyle(.spotifyGreen)
//                    .background(.spotifyGray)
            }
            .font(.title)
        }
        .font(.title2)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        PlaylistDescriptionCell()
    }
}
