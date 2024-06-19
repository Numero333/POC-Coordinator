//
//  NewPostView.swift
//  POC - Coordinator
//
//  Created by François-Xavier on 16/06/2024.
//

import SwiftUI

struct NewPostView: View {
    
    @EnvironmentObject private var coordinator: CoordinatorManager
    
    var body: some View {
        VStack {
            Text("NewPostView!")
            
            Button("Dismiss fullscreen cover") {
                coordinator.dismissFullScreenCover()
            }
        }
    }
}

#Preview {
    NewPostView()
}
