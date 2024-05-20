//
//  BumbleHeartView.swift
//  SwiftUIPractice
//
//  Created by 王佩豪 on 2024/5/17.
//

import SwiftUI

struct BumbleHeartView: View {
    
    var size : CGFloat = 40
    
    var body: some View {
        ZStack{
            Circle()
                .fill(.bumbleYellow)
                .frame(width: size,height: size)
            
            Image(systemName: "bubble.fill")
                .foregroundColor(.bumbleBlack)
                .font(.system(size: 22))
                .offset(x:1,y:2)
            
            Image(systemName: "heart.fill")
                .foregroundColor(.bumbleYellow)
                .font(.system(size: 12))
                .offset(x:1)
            
            
        }
    }
}

#Preview {
    BumbleHeartView()
}
