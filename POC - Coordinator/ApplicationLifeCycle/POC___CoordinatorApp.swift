//
//  CoordinatorApp.swift
//  POC - Coordinator
//
//  Created by François-Xavier on 16/06/2024.
//
import SwiftUI

@main
struct POC__CoordinatorApp: App {
    
    // MARK: - Properties
    @StateObject private var coordinator = CoordinatorManager()
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(appState.preferedColorScheme)
                .environmentObject(coordinator)
                .environmentObject(appState)
        }
    }
}
