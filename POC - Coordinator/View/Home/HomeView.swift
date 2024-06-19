//
//  HomeView.swift
//  POC - Coordinator
//
//  Created by François-Xavier on 16/06/2024.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var coordinator: CoordinatorManager
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        VStack(alignment: .leading, spacing: 80) {
            Text("This Proof of Concept demonstrates a coordinator pattern implementation in SwiftUI.")
            
            Text("Feel free to explore the code and navigate through the application.")
            
            Text("Your feedback is invaluable and greatly appreciated. Thank you for your participation!")
        }
        .padding(.horizontal, 50)
        .bold()
        .font(.title3)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.purple.opacity(0.6))
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    HomeView()
}
