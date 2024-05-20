//
//  BumbleHomeView.swift
//  SwiftUIPractice
//
//  Created by 王佩豪 on 2024/5/17.
//

import SwiftUI
import SwiftfulRouting
import SwiftfulUI

struct BumbleHomeView: View {
    
    @State private var filter: [String] = ["Everyone","Trending"]
    // 保存状态
    @AppStorage("bumble_home_filter_selection") private var selectionFilter : String = "Everyone"
    @State private var allUsers : [User] = []
    @State private var selectedIndex : Int = 0
    @State private var cardOffsets : [Int:Bool] = [:]
    @State private var currentSwipeOffset : CGFloat = 0
    @State var isSwiping : Bool = false
    
    
    @Environment(\.router) var router
    
    
    
    var body: some View {
        ZStack{
            Color.clear.ignoresSafeArea()
                .background(.ultraThinMaterial.opacity(0.5))
            
            VStack(spacing:24){
                header
                
                BumbleFilterView(
                    options: filter,
                    selection: selectionFilter
                )
                    .background(Divider() ,alignment: .bottom)

                ZStack{
                    if !allUsers.isEmpty {
                        ForEach(Array(allUsers.enumerated()),id:\.offset) { (index,user) in
                            
                            let isPrevious = (selectedIndex - 1) == index
                            let isCurrent = (selectedIndex) == index
                            let isNext = (selectedIndex + 1) == index
                            
                            if isCurrent || isPrevious || isNext {
                                
                                // 这个决定了是否偏移至看不到
                                let offsetValue = cardOffsets[user.id]
                                userProfileCell(user: user, index: index)
                                    .zIndex(Double(allUsers.count - index))
                                    .offset(x: offsetValue == nil ? 0 : offsetValue == true ? 900 : -900)
                                    .opacity(isCurrent ? 1 : 0.5)
                            }
                        }
                        .animation(.smooth())
                    }else{
                        ProgressView()
                    }
                    
                    
                    overlaySwipingIndicators
                        .animation(.smooth())
                        .animation(.smooth(), value: cardOffsets)
                        .zIndex(10000)
                    
                }
                .frame(maxHeight:.infinity)
                .animation(.smooth(), value: cardOffsets)
            }
            .padding(8)
        }
        .task {
            await getData()
        }
        .refreshable {
            await getData()
        }
    }
    
    private func userProfileCell(user: User,index:Int) -> some View{
        BumbleCardView(
            user: user,
            onSuperLinkPressed: nil,
            onXmarkPressed: {
                userDidSelect(index: index, isLike: false)
            },
            onCheckmarkPressed: {
                userDidSelect(index: index, isLike: true)
            },
            onSendMessagePressed: nil,
            onHideAndReportPressed: {
                
            }
        )
        .withDragGesture(
            .horizontal,
            minimumDistance: 20,
//              .resets: true,
//              .animation: T##Animation,
            rotationMultiplier: 1.0,
//            scaleMultiplier: 0.8,
            onChanged: { dragOffset in
                currentSwipeOffset = dragOffset.width
                
            },
            onEnded: { dragOffset in
                if dragOffset.width < -120{
                    userDidSelect(index: index, isLike: false)
                }else if dragOffset.width > 120{
                    userDidSelect(index: index, isLike: true)
                }
                
            })
                
    }
    
    private func getData() async {
        // 如果products为空,重新加载,如果已经有了,那就不重新加载
        guard allUsers.isEmpty else {return}
        do{
            allUsers = try await Array(DatabaseHelper().getUsers().prefix(8))
            
        }catch{
            
        }
    }
    
    private func userDidSelect(index:Int,isLike:Bool) {
        let user = allUsers[index]
        // 传入isLike,决定往哪边offset
        cardOffsets[user.id] = isLike
        
        selectedIndex += 1
    }
    
    private var header :some View{
        HStack(spacing:0){
            HStack(spacing:0){
                Image(systemName: "line.horizontal.3")
                    .padding(8)
//                    .foregroundStyle(.black)
                    .background(Color.clear.opacity(0.01))
                    .onTapGesture {
                        
                    }
                Image(systemName: "arrow.uturn.left")
                    .padding(8)
//                    .foregroundStyle(.black)
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
//                .foregroundStyle(.black)
                .background(Color.clear.opacity(0.01))
                .onTapGesture {
                    
                }
                .frame(maxWidth: .infinity,alignment:.trailing)
        }
        .font(.title2)
    }
    
    private var overlaySwipingIndicators :some View {
        ZStack{
            HStack{
                Circle()
                    .fill(.bumbleGray.opacity(0.4))
                    .overlay(
                        Image(systemName: "xmark")
                            .font(.title)
                            .fontWeight(.semibold)
                    )
                    .frame(width: 60, height: 60)
                    .scaleEffect(currentSwipeOffset < -100 ? 1.5 : 1.0)
                    .offset(x: min(-currentSwipeOffset, 150))
                    .offset(x: -100)
                    .frame(maxWidth:.infinity,alignment:.leading )
                
                Circle()
                    .fill(.bumbleGray.opacity(0.4))
                    .overlay(
                        Image(systemName: "checkmark")
                            .font(.title)
                            .fontWeight(.semibold)
                    )
                    .frame(width: 60, height: 60)
                    .scaleEffect(currentSwipeOffset > 100 ? 1.5 : 1.0)
                    .offset(x: max(-currentSwipeOffset, -150))
                    .offset(x: 100)
                    .frame(maxWidth:.infinity,alignment:.trailing)
            }
        }
    }
}

#Preview {
    BumbleHomeView()
}
