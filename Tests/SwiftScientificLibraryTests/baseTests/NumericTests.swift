import XCTest
import SwiftScientificLibrary

class NumericTests: XCTestCase {

    static var allTests: [(String, (NumericTests) -> () throws -> Void)] {
        return [
                ("testing Numeric operations", testDoubleOperations),
                ("testing Numeric operations", testComplexOperations),
                ("testing Numeric operations", testMixedOperations),
        ]
    }

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testDoubleOperations() {
        let d1 = Double(2.4)
        let d2 = Double(1.6)
        XCTAssertEqualWithAccuracy(d1 + d2, 4.0, accuracy:0.0001)
        XCTAssertEqualWithAccuracy(d1 - d2, 0.8, accuracy:0.0001)
        XCTAssertEqualWithAccuracy(d1 * d2, 3.84, accuracy:0.0001)
        XCTAssertEqualWithAccuracy(d1 / d2, 1.5, accuracy:0.0001)
    }

    func testComplexOperations() {
        let c1 = Complex(real: 0.5, imag: -1.5)
        let c2 = Complex(real: 2.5, imag: 1.0)
        XCTAssertEqualWithAccuracy(c1.modulus(), 1.5811, accuracy:0.01)
        XCTAssertTrue((c1 + c2) == Complex(real: 3.0, imag: -0.5))
        XCTAssertTrue((c1 - c2) == Complex(real: -2.0, imag: -2.5))
        XCTAssertTrue((c1 * c2) == Complex(real: 2.75, imag: -3.25))
        XCTAssertTrue((c1 / c2) == Complex(real: -0.0344827586206897, imag: -0.586206896551724))
    }

    func testMixedOperations() {
        let i1:Int = 3
        let d1 = 1.0

        XCTAssertEqualWithAccuracy(d1 + Double(i1), 4.0 , accuracy:1E-10)
    }


    func testApproxOperations() {
        XCTAssertTrue(1.0.isApproxEqual(to: 1.01,  accuracy: 0.1))
        XCTAssertFalse(3.isApproxEqual(to: 1,  accuracy: 0.1))
        XCTAssertTrue(3.isApproxEqual(to: 1,  accuracy: 2))
        XCTAssertTrue(Complex(real: 2, imag: 0).isApproxEqual(to:2.0,  accuracy: 0.001))
        XCTAssertTrue(Complex(real: 2, imag: 1).isApproxEqual(to:Complex(real: 2, imag: 1),
                accuracy: 0.00001))
        XCTAssertFalse(Complex(real: 2, imag: 1).isApproxEqual(to:Complex(real: 2, imag: 0.99),
                accuracy: 0.00001))
        XCTAssertTrue(Complex(real: 2, imag: 1).isApproxEqual(to:Complex(real: 2, imag: 0.99),
                accuracy: 0.1))
    }

}

#if os(Linux)
extension NumericTests {
    static var allTests: [(String, (NumericTests) -> () throws -> Void)] {
        return [
                ("testing Numeric operations", testDoubleOperations),
                ("testing Numeric operations", testComplexOperations),
                ("testing Numeric operations", testMixedOperations),
                ("testing Numeric operations", testApproxOperations)
        ]
    }

}
#endif
