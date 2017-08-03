import XCTest
import SwiftScientificLibrary

class VectorTests: XCTestCase {

    let vd1 = Vector<Double>([Double(1.0), Double(4.2)])
    var vd2 = Vector<Double>(dimensions:4, defaultValue:0.0)
    var vd3 = Vector<Double>(dimensions:4, defaultValue:1.0)

    var vc1 = Vector<Complex>(dimensions:3, defaultValue:Complex(real: 0.0, imag: 0.0))
    let vc2 = Vector<Complex>(dimensions:3, defaultValue:Complex(real: 1.0, imag: 0.0))
    let vc3 = Vector<Complex>([Complex(real: 2.0, imag: 3.2), Complex(real: 2.2, imag: 2.6)])

    let vi1 = Vector<Int>([2,1,3,4,5])

    override func setUp() {
        super.setUp()
        continueAfterFailure = true

        vd2[1] = 1.6
        vd3[1] = 0.2
        vd3[3] = 1.7
        vc1[0] = Complex(real: 0.0, imag: 1.0)
        vc1[1] = Complex(real: 0.5, imag: 1.5)
        vc1[2] = Complex(real: 1.0, imag: 1.0)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testVectorDotProductDoubleDouble() {
        try XCTAssertEqual (vd1.dot(vector: vd1), 18.64)
        try XCTAssertEqualWithAccuracy (vd2.dot(vector: vd3), 0.32, accuracy:0.0001)
    }


    func testVectorDotProductComplexComplex() {
        try XCTAssert(vc1.dot(vector: vc2) == Complex(real: 1.5, imag: 3.5))
        try XCTAssert(vc3.dot(vector: vc3) == Complex(real: -8.1600, imag: 24.240))
    }


    func testVectorDotProductIntegerInteger() {
        try XCTAssert(vi1.dot(vector: vi1) == 55)
    }

}

#if os(Linux)
extension VectorTests {
    static var allTests : [(String, (VectorTests) -> () throws -> Void)] {
        return [
            ("testing Vector operations", testVectorDotProductDoubleDouble),
            ("testing Vector operations", testVectorDotProductComplexComplex),
            ("testing Vector operations", testVectorDotProductIntegerInteger)
        ]
    }

}
#endif
