import XCTest
import SwiftScientificLibrary

class ConstTests: XCTestCase {

    func testPhysicalConstants() {
        //XCTAssertEqual(constC.value, 2.99792458e8)
        //XCTAssertEqual(constC.unit, "m/s")
        
    }
}

#if os(Linux)
extension ConstTests {
    static var allTests : [(String, (ConstTests) -> () throws -> Void)] {
        return [
            ("testing Physical Constants", testPhysicalConstants),
        ]
    }

}
#endif 

