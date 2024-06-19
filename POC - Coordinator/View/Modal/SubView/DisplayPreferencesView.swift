//
//  DisplayPreferencesView.swift
//  POC - Coordinator
//
//  Created by François-Xavier on 16/06/2024.
//

import SwiftUI

struct DisplayPreferencesView: View {
    
    @EnvironmentObject private var appState: AppState
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Change the app color")
                .font(.title)
            HStack {
                Button("Set App color to dark") {
                    appState.preferedColorScheme = .dark
                    dismiss()
                }
                
                Button("Set App color to light") {
                    appState.preferedColorScheme = .light
                    dismiss()
                }
            }
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    DisplayPreferencesView()
}
