//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by 王佩豪 on 2024/5/14.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    
    @Environment(\.router) var router
    var body: some View {
        
        List{
            Button("Open Spotify"){
                router.showScreen(.fullScreenCover) { _ in
                    SpotifyHomeView()
                }
            }
            Button("Open Bumble"){
                router.showScreen(.fullScreenCover) { _ in
                    BumbleHomeView()
                }
            }
        }
    }
}
#Preview {
    RouterView{ _ in
        ContentView()
    }
}
