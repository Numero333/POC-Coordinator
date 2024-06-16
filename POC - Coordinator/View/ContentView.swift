//
//  ContentView.swift
//  POC - Coordinator
//
//  Created by François-Xavier on 16/06/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var coordinator = CoordinatorManager()
    
    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            coordinator.build(appView: .home)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(AppView.home)
            
            coordinator.build(appView: .profile)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .tag(AppView.profile)
            
            coordinator.build(appView: .messages)
                .tabItem {
                    Label("Messages", systemImage: "message")
                }
                .tag(AppView.messages)
            
            coordinator.build(appView: .messages)
                .tabItem {
                    Label("Parameters", systemImage: "gear")
                }
                .tag(AppView.parameters)
        }
        .fullScreenCover(item: $coordinator.fullScreenCover) { fullScreenCover in
            coordinator.build(fullScreenCover: .newPost)
        }
    }
}

#Preview {
    ContentView()
}
