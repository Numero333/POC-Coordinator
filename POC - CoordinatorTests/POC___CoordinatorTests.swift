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
        coordinator.push(.parameters)
        coordinator.navigateBack()
        XCTAssertTrue(coordinator.path.isEmpty)
    }
    
    func testNavigateToRoot() {
        coordinator.push(.parameters)
        coordinator.push(.notifications)
        coordinator.navigateToRoot()
        XCTAssertTrue(coordinator.path.isEmpty)
    }
    
    func testPresentFullScreenCover() {
        coordinator.present(fullScreenCover: .fullSreenCover)
        XCTAssertNotNil(coordinator.fullScreenCover)
        XCTAssertEqual(coordinator.fullScreenCover, .fullSreenCover)
    }
    
    func testDismissFullScreenCover() {
        coordinator.present(fullScreenCover: .fullSreenCover)
        coordinator.dismissFullScreenCover()
        XCTAssertNil(coordinator.fullScreenCover)
    }
}
