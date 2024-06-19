//
//  CoordinatorManager.swift
//  POC - Coordinator
//
//  Created by François-Xavier on 16/06/2024.
//

import SwiftUI

// MARK: - App View Enum
enum AppView: String, Identifiable, CaseIterable {
    case home, navigate, modal, alert
    
    var id: String {
        self.rawValue
    }
    
    /// Title for the tab
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .navigate:
            return "Navigate"
        case .modal:
            return "Modal"
        case .alert:
            return "Alert"
        }
    }
    
    /// System image name for the tab
    var image: String {
        switch self {
        case .home:
            return "house"
        case .navigate:
            return "rectangle.portrait.and.arrow.right.fill"
        case .modal:
            return "square.stack.fill"
        case .alert:
            return "exclamationmark.triangle"
        }
    }
}

// MARK: - Sub View Enum
enum SubView: String, Identifiable {
    case notifications, displayPreferences, parameters
    
    var id: String {
        self.rawValue
    }
}

// MARK: - Full Screen Cover Enum
enum FullScreenCover: String, Identifiable {
    case fullSreenCover
    
    var id: String {
        self.rawValue
    }
}

// MARK: - Half Screen Sheet Enum
enum HalfScreenSheet: String, Identifiable {
    case preferenceView
    
    var id: String {
        self.rawValue
    }
}

// MARK: - Coordinator Manager
final class CoordinatorManager: ObservableObject {
    
    // MARK: Properties
    @Published var path = NavigationPath()  // Keeps track of the navigation stack
    @Published var halfScreenSheet: HalfScreenSheet?
    @Published var fullScreenCover: FullScreenCover?  // Currently displayed full screen cover
    @Published var selectedTab: AppView = .home  // Currently selected tab
    @Published var alertIsPresented = false
    
    // MARK: - Methods
    /// Navigate to a specific subview
    func push(_ subView: SubView) {
        path.append(subView)
    }
    
    /// Present a full screen cover
    func present(fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    /// Present a half screen sheet
    func present(halfScreenSheet: HalfScreenSheet) {
        self.halfScreenSheet = halfScreenSheet
    }
    
    /// Present an alert for an error
    func presentAlert() {
        self.alertIsPresented = true
    }
    
    /// Navigate back to the previous view
    func navigateBack() {
        guard !path.isEmpty else {
            print("Navigation Error: Path is already empty.")
            return
        }
        path.removeLast()
    }
    
    /// Navigate to the root view
    func navigateToRoot() {
        guard !path.isEmpty else {
            print("Navigation Error: Path is already empty.")
            return
        }
        path.removeLast(path.count)
    }
    
    /// Dismiss the current full screen cover
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
    
    /// Dismiss the current half screen sheet
    func dismissSheet() {
        self.halfScreenSheet = nil
    }
    
    /// Dismiss the current alert
    func dismissAlert() {
        self.alertIsPresented = false
    }
    
    // MARK: - View Builder
    /// Build views based on the selected app view
    @ViewBuilder
    func build(appView: AppView) -> some View {
        switch appView {
        case .home: HomeView()
        case .navigate: NavigateView()
        case .modal: ModalView()
        case .alert: AlertView()
        }
    }
    
    /// Build views based on the selected subview
    @ViewBuilder
    func build(subView: SubView) -> some View {
        switch subView {
        case .notifications: NotificationView()
        case .displayPreferences: DisplayPreferencesView()
        case .parameters: ParametersView()
        }
    }
    
    /// Build views based on the selected full screen cover
    @ViewBuilder
    func build(fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .fullSreenCover: FullScrenCoverView()
        }
    }
    
    /// Build views based on the selected half screen sheet
    @ViewBuilder
    func build(halfScreenSheet: HalfScreenSheet) -> some View {
        switch halfScreenSheet {
        case .preferenceView: DisplayPreferencesView()
        }
    }
}
