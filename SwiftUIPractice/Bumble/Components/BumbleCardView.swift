//
//  BumbleCardView.swift
//  SwiftUIPractice
//
//  Created by 王佩豪 on 2024/5/17.
//

import SwiftUI
import SwiftfulUI

struct BumbleCardView: View {
    
    var user : User = .mock
    var onSuperLinkPressed : (() -> Void)? = nil
    var onXmarkPressed : (() -> Void)? = nil
    var onCheckmarkPressed : (() -> Void)? = nil
    var onSendMessagePressed : (() -> Void)? = nil
    var onHideAndReportPressed : (() -> Void)? = nil
    
    
    @State private var cardFrame :CGRect = .zero
    
    var body: some View {
        ScrollView(.vertical){
            LazyVStack{

                heardCell
                    .frame(height: cardFrame.height)
//                    .cornerRadius(30)
             
//                if isSwiping {
                    VStack(alignment:.leading,spacing:0){
                        aboutSection
                            .padding(24)
                                               
                        interestAndBasicSection
                            .padding(24)
                        
                        ForEach(user.images,id:\.self){image in
                            ImageLoaderView(urlString: image)
                                .frame(height: cardFrame.height / 2)
                                .background(.bumbleLightYellow)
    //                            .cornerRadius(30)
                        }
                    
                        locationSection
                            .padding()
                        
                        footerSection
                            .padding(.top)

                    }
                    .frame(maxWidth:.infinity,alignment:.leading)
                    .background(.bumbleBackgroundYellow)
//                    .cornerRadius(30)
//                }

            }
            .background(.bumbleWhite)
        }
        .scrollIndicators(.hidden)
        .mask {
            Rectangle()
                .cornerRadius(30)
        }
        .overlay(
            superLink
                .padding(24)
                .onTapGesture {
                    onSuperLinkPressed?()
                }
            
            ,alignment: .bottomTrailing
        )
        .readingFrame { frame in
            cardFrame = frame
        }
    }
    
    private var superLink:some View{
        Image(systemName: "hexagon.fill")
            .foregroundStyle(.bumbleYellow)
            .font(.system(size: 60))
            .overlay(
                Image(systemName: "star.fill")
                    .foregroundStyle(.bumbleBlack)
                    .font(.system(size: 30).weight(.medium))
            )
            
    }
    
    private var aboutSection:some View {
        VStack (alignment:.leading){
            sectionTitle(title: "About me")
            Text(user.aboutMe)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundStyle(.bumbleBlack)
            
            HStack{
                BumbleHeartView()
                 
                Text(" something")
                    .font(.body)
                    .fontWeight(.semibold)
                    .padding(.trailing,6)
            }
            .padding(.horizontal,4)
            .background(.bumbleYellow)
            .cornerRadius(30)
            .onTapGesture {
                onSendMessagePressed?()
            }
        }
    }
    
    private var interestAndBasicSection:some View {
        VStack(alignment:.leading,spacing: 30){
            VStack(alignment:.leading,spacing: 12){
                sectionTitle(title: "Interests")
                InterestPillGridView(interests: User.mock.interests)
            }
            
            VStack(alignment:.leading,spacing: 12){
                sectionTitle(title: "Basics")
                InterestPillGridView(interests: User.mock.basics)
            }
        }
    }
    
    private var locationSection:some View{
        VStack(alignment:.leading,spacing:6){
            HStack{
                Image(systemName: "mappin.and.ellipse.circle")
                Text("\(user.lastName)'s location")
                    .foregroundStyle(.bumbleGray)
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            
            Text("10 mails away")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.bumbleBlack)
            
            InterestPillView(iconName: nil,emoji: "🇨🇳", text: "lives in Beijin,China")
            
        }
        .frame(maxWidth: .infinity,alignment: .leading)
    }
    
    private var footerSection:some View {
        VStack{
            HStack{
                Circle()
                    .fill(.bumbleYellow)
                    .overlay(
                        Image(systemName: "xmark")
                            .font(.title)
                            .fontWeight(.semibold)
                    )
                    .frame(width: 60,height: 60)
                    .onTapGesture {
                        onXmarkPressed?()
                    }
                    .padding(.horizontal,48)
                
                Spacer()
                Circle()
                    .fill(.bumbleYellow)
                    .overlay(
                        Image(systemName: "checkmark")
                            .font(.title)
                            .fontWeight(.semibold)
                    )
                    .frame(width: 60,height: 60)
                    .onTapGesture {
                        onCheckmarkPressed?()
                    }
                    .padding(.horizontal,48)
            }
            Text("Hide and report")
                .font(.headline)
                .foregroundStyle(.bumbleGray)
                .padding(.vertical,40)
                .background(Color.clear.opacity(0.01))
                .onTapGesture {
                    onHideAndReportPressed?()
                }
        }
    }
    
    private func sectionTitle(title : String) -> some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundStyle(.bumbleGray)
    }
    
    fileprivate var heardCell :some View {
        ZStack(alignment:.bottomLeading){
            ImageLoaderView(urlString: user.image)
            
            VStack(alignment:.leading,spacing: 8){
                Text("\(user.lastName),\(user.age)")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                HStack(spacing:4){
                    Image(systemName: "suitcase")
                    Text(user.work)
                }
                
                HStack(spacing:4){
                    Image(systemName: "graduationcap")
                    Text(user.education)
                }
                
                BumbleHeartView()
                    .onTapGesture {
                        
                    }
            }
            .font(.callout)
            .fontWeight(.medium)
            .foregroundStyle(.bumbleWhite)
            .padding(24)
            .frame(maxWidth: .infinity,alignment:.leading)
            .background(
                .linearGradient(
                    colors: [.bumbleBlack.opacity(0),
                             .bumbleBlack.opacity(0.4),
                             .bumbleBlack.opacity(0.4)],
                                startPoint: .top, endPoint: .bottom)
            )
        }
    }
}



#Preview {
    BumbleCardView()
        .padding(.vertical,40)
        .padding(.horizontal,20)
}
