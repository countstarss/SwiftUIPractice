//
//  SwiftUIView.swift
//  SwiftUIPractice
//
//  Created by 王佩豪 on 2024/5/17.
//

import SwiftUI

struct InterestPillView: View {
    var iconName :String? = "ruler"
    var emoji :String? = "🥳"
    var text: String = "Graduate Degree"
    
    var body: some View {
        HStack{
            if let iconName {
                Image(systemName: iconName)
            }else if let emoji{
                Text(emoji)
            }
            
            Text(text)
        }
        .font(.callout)
        .fontWeight(.semibold)
        .padding(8)
        .padding(.horizontal,4)
        .foregroundStyle(.bumbleBlack)
        .background(.bumbleLightYellow)
        .cornerRadius(20)
    }
}

#Preview {
    VStack{
        InterestPillView(iconName: "ruler", text: "ruler")
        InterestPillView(emoji: "👻", text: "guest")
        InterestPillView(emoji: "🎃", text: "melon")
        InterestPillView(iconName: "graduationcap", text: "graduation")
    }
}
