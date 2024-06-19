//
//  CoordinatorView.swift
//  POC - Coordinator
//
//  Created by François-Xavier on 19/06/2024.
//

import SwiftUI

struct CoordinatorView: View {
    
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
            coordinator.build(fullScreenCover: fullScreenCover)
        }
        .sheet(item: $coordinator.halfScreenSheet) { halfScreenSheet in
            coordinator.build(halfScreenSheet: halfScreenSheet)
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
    CoordinatorView()
}
