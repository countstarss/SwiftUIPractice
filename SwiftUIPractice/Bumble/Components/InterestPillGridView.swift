//
//  InterestPillGridView.swift
//  SwiftUIPractice
//
//  Created by 王佩豪 on 2024/5/17.
//

import SwiftUI
import SwiftfulUI

struct UserInterest:Identifiable{
    let id = UUID().uuidString
    var iconName : String? = nil
    var emoji : String? = nil
    var text:String
}

struct InterestPillGridView: View {

    var interests : [UserInterest] = User.mock.interests
    
    var body: some View {
        
        ZStack{
            NonLazyVGrid(columns: 2, alignment: .leading, spacing: 10, items: interests) { interest in
                if let interest{
                    InterestPillView(iconName: interest.iconName,emoji: interest.emoji, text: interest.text)
                }else{
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    VStack(alignment: .leading, spacing:40){
        InterestPillGridView(interests: User.mock.interests)
        InterestPillGridView(interests: User.mock.basics)
    }
}
