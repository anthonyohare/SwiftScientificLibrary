import XCTest
import SwiftScientificLibrary

class RandTests: XCTestCase {

    static var allTests: [(String, (RandTests) -> () throws -> Void)] {
        return [
                ("testing Mersenne Twister", testMersenneTwister),
        ]
    }

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testMersenneTwister() {
        let generator = MersenneTwister(seed: 0)
        let a = generator.sample()
        let b = generator.sample()
        let c = generator.sample()
        let d = generator.sample()

        XCTAssert(a != b && a != c && a != d && b != c && b != d && c != d, "Technically, we *could* get a collision...")

        // Test MersenneTwister against the reference implementation to verify output, we use the 64 bit implementation
        // in the standard C++ library.
        let g1 = MersenneTwister(seed: 12345678)
        let g2 = [0.403216165273077, 0.98143454441732, 0.337375050368558, 0.179185783312743, 0.249761518776771,
                  0.296910269261057, 0.204993272058105, 0.61275606794655, 0.194577590541452, 0.219026434499842]

        for i in 0 ..< 10 {
            XCTAssertEqual(g1.sample(), g2[i], accuracy:0.000000000000001)
        }

        measure {
            for _ in 0 ..< 100000 {
                _ = g1.sample()
            }
        }
    }
}
