//
//  BumbleHomeView.swift
//  SwiftUIPractice
//
//  Created by 王佩豪 on 2024/5/17.
//

import SwiftUI

struct BumbleHomeView: View {
    
    @State private var filter: [String] = ["Everyone","Trending"]
    // 保存状态
    @AppStorage("bumble_home_filter_selection") private var selectionFilter : String = "Everyone"
    // @State private var selectionFilter : String = "Everyone"
    
    var body: some View {
        ZStack{
            Color.bumbleWhite.ignoresSafeArea()
            
            VStack(spacing:24){
                header
                
                BumbleFilterView(options: filter, selection: selectionFilter)
                    .background(Divider() ,alignment: .bottom)
                    
                
                Spacer()
            }
            .padding(8)
        }
    }
    
    private var header :some View{
        HStack(spacing:0){
            HStack(spacing:0){
                Image(systemName: "line.horizontal.3")
                    .padding(8)
                    .background(Color.clear.opacity(0.01))
                    .onTapGesture {
                        
                    }
                Image(systemName: "arrow.uturn.left")
                    .padding(8)
                    .background(Color.clear.opacity(0.01))
                    .onTapGesture {
                        
                    }
            }
            .frame(maxWidth: .infinity,alignment:.leading)
            
            Text("bumble")
                .font(.title)
                .fontWeight(.bold)
                .padding(3)
                .foregroundStyle(.bumbleYellow)
                .frame(maxWidth: .infinity,alignment:.center)
            
            Image(systemName: "slider.horizontal.3")
                .padding(8)
                .background(Color.clear.opacity(0.01))
                .onTapGesture {
                    
                }
                .frame(maxWidth: .infinity,alignment:.trailing)
        }
        .font(.title2)
    }
}

#Preview {
    BumbleHomeView()
}
