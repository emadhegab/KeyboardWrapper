import UIKit
import XCTest
import KeyboardWrapper

class KeyboardInfoTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testAnimationCurve() {
        let expectedCurves: [UIViewAnimationCurve] = [.easeInOut, .easeIn, .easeOut, .linear]

        let curves = expectedCurves.map { c in
            KeyboardInfo.fromNotificationUserInfo([UIKeyboardAnimationCurveUserInfoKey: c.rawValue], state: .willShow).animationCurve
        }
        XCTAssertEqual(curves, expectedCurves)
    }

    func testAnimationOptions() {
        let curves: [UIViewAnimationCurve] = [.easeInOut, .easeIn, .easeOut, .linear]

        let options = curves.map { c in
            KeyboardInfo.fromNotificationUserInfo([UIKeyboardAnimationCurveUserInfoKey: c.rawValue], state: .willShow).animationOptions
        }
        XCTAssertEqual(options, [.curveEaseInOut, .curveEaseIn, .curveEaseOut, .curveLinear])
    }
}
