//
//  AlertView.swift
//  POC - Coordinator
//
//  Created by François-Xavier on 18/06/2024.
//

import SwiftUI

struct AlertView: View {
    
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        VStack(spacing: 50) {
            Text("This view displays a simple alert by setting the errorMessage variable. The onChange modifier reacts to this change and presents the alert.")
                .frame(alignment: .center)
                .multilineTextAlignment(.center)
            
            Button {
                appState.errorMessage = "A test error has been generated"
            } label: {
                Text("Generate Test Error")
            }
        }
        .padding(.horizontal, 50)
        .bold()
        .font(.title3)
        .buttonStyle(.borderedProminent)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.red.opacity(0.7))
        .navigationTitle("Alert")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AlertView()
}
