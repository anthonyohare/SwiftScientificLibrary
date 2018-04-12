import XCTest
import SwiftScientificLibrary

class DoubleTests: XCTestCase {

    static var allTests: [(String, (DoubleTests) -> () throws -> Void)] {
        return [
            ("testing Double operations", testEquality),
            ("testing Double operations", testCeil),
            ("testing Double operations", testFloor),
        ]
    }

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testEquality() {
        let d1 = Double(2.4)
        let d2 = Double(1.6)
        XCTAssertFalse((d1 + d2).isEqual(to: 4.00001))
        XCTAssertTrue((d1 + d2).isEqual(to: 4.0))
        XCTAssertTrue((-1.2).isEqual(to: -1.2))
        XCTAssertTrue((5.5555).isEqual(to: 5.5555))
        XCTAssertTrue((-3.35).isEqual(to: -3.35))
        XCTAssertTrue((4.16).isEqual(to: 4.16))
        XCTAssertTrue((0.332053742802303).isEqual(to: 0.332053742802303))

        var b = -0.967370441458733
        XCTAssertTrue(b.isEqual(to: -0.967370441458733))
        b = 4.16
        XCTAssertTrue(b.isEqual(to: 4.16))
    }


    func testCeil() {
        XCTAssertTrue((0.3).ceil == 1.0)
        XCTAssertTrue((-0.3).ceil == 0.0)
    }

    func testFloor() {
        XCTAssertTrue((0.3).floor == 0.0)
        XCTAssertTrue((-0.3).floor == -1.0)
    }

}

#if os(Linux)
extension DoubleTests {
    static var allTests: [(String, (DoubleTests) -> () throws -> Void)] {
        return [
                ("testing Double operations", testEquality),
                ("testing Double operations", testCeil),
                ("testing Double operations", testFloor)
        ]
    }

}
#endif
