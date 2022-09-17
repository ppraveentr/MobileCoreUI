import SwiftUI
import XCTest
@testable import Core

final class ColorTests: XCTestCase {
    func testHexColor() throws {
        XCTAssertNotNil(Color(hex: "#EE4B2B"), "Should generate valid color from hex string")
    }
}
