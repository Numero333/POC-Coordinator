//
//  FullScrenCoverView.swift
//  POC - Coordinator
//
//  Created by François-Xavier on 19/06/2024.
//

import SwiftUI

struct FullScrenCoverView: View {
    
    @EnvironmentObject private var coordinator: CoordinatorManager
    
    var body: some View {
        VStack {
            Text("Full Screen Cover Presented !")
            
            Button("Dismiss fullscreen cover") {
                coordinator.dismissFullScreenCover()
            }
        }
    }
}

#Preview {
    FullScrenCoverView()
}
