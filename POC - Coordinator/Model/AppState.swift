//
//  AppState.swift
//  POC - Coordinator
//
//  Created by François-Xavier on 17/06/2024.
//

import SwiftUI

class AppState: ObservableObject {
    
    // MARK: - Properties
    @Published var errorMessage: String = ""
    @Published var preferedColorScheme: ColorScheme = .light
    
    // MARK: - Methods
    func resetError() {
        self.errorMessage = ""
    }
    
}
