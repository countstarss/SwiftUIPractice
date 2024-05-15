//
//  SpotifyCategoryCell.swift
//  SwiftUIPractice
//
//  Created by 王佩豪 on 2024/5/14.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    
    var title:String = "Music"
    var isSelected:Bool = false
    
    var body: some View {
        Text(title)
            .font(.callout)
            .padding(10)
            .frame(height: 40)
            .frame(minWidth: 55)
            .themeColors(isSelected: isSelected)
            .cornerRadius(20)
            
    }
}

extension View{
    func themeColors(isSelected : Bool) -> some View{
        self
            .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite) 
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        
        VStack (spacing:40){
            SpotifyCategoryCell(title: "Music",isSelected: true)
            SpotifyCategoryCell(title: "Music")
            SpotifyCategoryCell(title: "Music")
            SpotifyCategoryCell(title: "Music")
        }
    }
}
