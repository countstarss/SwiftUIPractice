//
//  BumbleFilterView.swift
//  SwiftUIPractice
//
//  Created by 王佩豪 on 2024/5/17.
//

import SwiftUI

struct BumbleFilterView: View {
    
    var options: [String] = ["Everyone","Trending"]
    @State var selection : String = "Everyone"
    @Namespace private var namespace
    
    var body: some View {
        HStack(alignment:.top){
            ForEach(options,id: \.self){option in
                VStack{
                    Text(option)
                        .frame(maxWidth:.infinity)
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    // opacity
//                    RoundedRectangle(cornerRadius: 2)
//                        .frame(height: 1.5)
//                        .opacity(selection == option ? 1 : 0)
                    
                    // display
                    if selection == option {
                        RoundedRectangle(cornerRadius: 2)
                            .frame(height: 1.5)
                            .matchedGeometryEffect(id: "ID", in: namespace)
                    }
                }
                .foregroundStyle(selection == option ? .bumbleBlack : .bumbleGray)
                .onTapGesture {
                    withAnimation(.smooth(duration: 0.3)) {
                        selection = option
                    }
                }
            }
        }
        
    }
}


fileprivate struct BumbleFilterViewPreview :View {
    
    // 这里写了预览视图,那么这里的数据就决定了显示的内容
    // 上面就是写了一个模板
    var options: [String] = ["Everyone","Trending","Favorite"]
    @State var selection : String = "Everyone"
    
    var body: some View{
        BumbleFilterView(options: options, selection: selection)
    }
}

#Preview {
    BumbleFilterViewPreview()
        .padding()
}
