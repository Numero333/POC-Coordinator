//
//  CoordinatorManager.swift
//  POC - Coordinator
//
//  Created by François-Xavier on 16/06/2024.
//

import SwiftUI

// MARK: - Base View
enum AppView: String, Identifiable {
    case home, profile, messages, parameters
    
    var id: String {
        self.rawValue
    }
}

// MARK: - Sub View
enum SubView: String, Identifiable {
    case news, recommendation, information, history, lastChat, contact, notifications, displayPreferences
    
    var id: String {
        self.rawValue
    }
}

// MARK: - FullScreenCover View
enum FullScreenCover: String, Identifiable {
    case newPost
    
    var id: String {
        self.rawValue
    }
}

// MARK: - Coordinator Manager
final class CoordinatorManager: ObservableObject {
    
    // MARK: Properties
    @Published var path = NavigationPath()  // Keeps track of the navigation stack
    @Published var fullScreenCover: FullScreenCover?  // Current full screen cover
    @Published var selectedTab: AppView = .home  // Currently selected tab
    
    // MARK: - Methods
    
    // Navigate to a specific subview
    func push(_ subView: SubView) {
        path.append(subView)
    }
    
    // Present a full screen cover
    func present(fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    // Navigate back to the previous view
    func navigateBack() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    // Navigate to the root view
    func navigateToRoot() {
        guard !path.isEmpty else { return }
        path.removeLast(path.count)
    }
    
    // Dismiss the current full screen cover
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
    
    // MARK: - View Builder
    
    // Build views based on the selected app view
    @ViewBuilder
    func build(appView: AppView) -> some View {
        switch appView {
        case .home: HomeView()
        case .profile: ProfileView()
        case .messages: MessageView()
        case .parameters: ParametersView()
        }
    }
    
    // Build views based on the selected subview
    @ViewBuilder
    func build(subView: SubView) -> some View {
        switch subView {
        case .news: NewsView()
        case .recommendation: RecommendationView()
        case .information: InformationView()
        case .history: HistoryView()
        case .lastChat: LastChatsView()
        case .contact: ContactView()
        case .notifications: NotificationView()
        case .displayPreferences: DisplayPreferencesView()
        }
    }
    
    // Build views based on the selected full screen cover
    @ViewBuilder
    func build(fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .newPost: NewPostView()
        }
    }
}
