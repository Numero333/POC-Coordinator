//
//  ParametersView.swift
//  POC - Coordinator
//
//  Created by François-Xavier on 16/06/2024.
//

import SwiftUI

struct ParametersView: View {
    
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var coordinator: CoordinatorManager
    
    var body: some View {
        VStack {
            Button {
                coordinator.push(.notifications)
            } label: {
                Text("Notification View")
            }
            .buttonStyle(.borderedProminent)
        }
        
        .navigationTitle("Parameters")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ParametersView()
}
