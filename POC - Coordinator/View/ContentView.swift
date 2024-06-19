//
//  ContentView.swift
//  POC - Coordinator
//
//  Created by François-Xavier on 16/06/2024.
//

import SwiftUI

#warning("Améliorer UI Global rapidement")
#warning("Verification Chat gpt")

struct ContentView: View {
    
    @EnvironmentObject private var coordinator: CoordinatorManager
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            ForEach(AppView.allCases, id: \.self) { tab in
                NavigationStack(path: $coordinator.path) {
                    coordinator.build(appView: tab)
                        .navigationDestination(for: SubView.self) { subView in
                            coordinator.build(subView: subView)
                        }
                }
                .tabItem {
                    Label(tab.title, systemImage: tab.image)
                }
                .tag(tab.id)
            }
            .toolbarBackground(.ultraThinMaterial, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
        .fullScreenCover(item: $coordinator.fullScreenCover) { fullScreenCover in
            coordinator.build(fullScreenCover: .newPost)
        }
        .sheet(item: $coordinator.halfScreenSheet) { halfScreenSheet in
            coordinator.build(halfScreenSheet: .preferenceView)
                .presentationDetents([.fraction(0.5)])
        }
        .alert("Error", isPresented: $coordinator.alertIsPresented, actions: {
            Button("OK") {
                coordinator.dismissAlert()
                appState.resetError()
            }
        }, message: {
            Text(appState.errorMessage)
        })
        .onChange(of: appState.errorMessage) {
            if !appState.errorMessage.isEmpty {
                coordinator.presentAlert()
            }
        }
    }
}

#Preview {
    ContentView()
}
