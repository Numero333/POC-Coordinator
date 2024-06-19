//
//  NavigateView.swift
//  POC - Coordinator
//
//  Created by François-Xavier on 19/06/2024.
//

import SwiftUI

struct NavigateView: View {
    
    @EnvironmentObject private var coordinator: CoordinatorManager
    
    var body: some View {
        VStack {
            Text("This view displays a toolbar item for navigating to the parameters.")
                .frame(alignment: .center)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 50)
        .bold()
        .font(.title3)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.orange.opacity(0.6))
        .navigationTitle("Navigate")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    coordinator.push(.parameters)
                }) {
                    Label("Parameters", systemImage: "gear")
                }
            }
        }
    }
}

#Preview {
    NavigateView()
}
