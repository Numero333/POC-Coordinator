//
//  ModalView.swift
//  POC - Coordinator
//
//  Created by François-Xavier on 19/06/2024.
//

import SwiftUI

struct ModalView: View {
    
    @EnvironmentObject private var coordinator: CoordinatorManager
    
    var body: some View {
        VStack(spacing: 50) {
            
            Text("This view displays a full screen cover and a half-screen sheet.")
                .frame(alignment: .center)
                .multilineTextAlignment(.center)
            
            Button { coordinator.present(fullScreenCover: .fullSreenCover) } label: {
                Text("Show Full Screen Cover")
            }
            
            Button { coordinator.present(halfScreenSheet: .preferenceView) } label: {
                Text("Show Half-Screen Sheet")
            }
        }
        .padding(.horizontal, 50)
        .bold()
        .font(.title3)
        .buttonStyle(.borderedProminent)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.green.opacity(0.3))
        .navigationTitle("Modal")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ModalView()
}
