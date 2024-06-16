//___FILEHEADER___

import XCTest

import XCTest
@testable import POC___Coordinator

class CoordinatorManagerTests: XCTestCase {
    
    var coordinator: CoordinatorManager!
    
    override func setUp() {
        super.setUp()
        coordinator = CoordinatorManager()
    }
    
    override func tearDown() {
        coordinator = nil
        super.tearDown()
    }
    
//    func testPushSubView() {
//        coordinator.push(.news)
//        XCTAssertEqual(coordinator.path.count, 1)
//        XCTAssertEqual(coordinator.path.last as? SubView, .news)
//    }
    
    func testNavigateBack() {
        coordinator.push(.news)
        coordinator.navigateBack()
        XCTAssertTrue(coordinator.path.isEmpty)
    }
    
    func testNavigateToRoot() {
        coordinator.push(.news)
        coordinator.push(.history)
        coordinator.navigateToRoot()
        XCTAssertTrue(coordinator.path.isEmpty)
    }
    
    func testPresentFullScreenCover() {
        coordinator.present(fullScreenCover: .newPost)
        XCTAssertNotNil(coordinator.fullScreenCover)
        XCTAssertEqual(coordinator.fullScreenCover, .newPost)
    }
    
    func testDismissFullScreenCover() {
        coordinator.present(fullScreenCover: .newPost)
        coordinator.dismissFullScreenCover()
        XCTAssertNil(coordinator.fullScreenCover)
    }
}
