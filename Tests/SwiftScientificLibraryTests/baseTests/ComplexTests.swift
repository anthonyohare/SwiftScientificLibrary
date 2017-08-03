import XCTest
import SwiftScientificLibrary


class ComplexTests: XCTestCase {

    let c1 = Complex(real: 1.1, imag: 2.0)
    let c2 = Complex(real: 2.3, imag: -0.4)
    let c3 = Complex(real: 0.75, imag: 0.0)
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testComplexInit() {

        XCTAssertEqual(c1.real(), 1.1)
        XCTAssertEqual(c1.imag(), 2.0)
        XCTAssertEqual(c2.real(), 2.3)
        XCTAssertEqual(c2.imag(), -0.4)
    }


    func testComplexOperations() {

        XCTAssertEqual(c1+c2, c2+c1)
        XCTAssertEqual(c2*c1, c2*c1)

        XCTAssertEqual(c1+c2, Complex(real:3.4, imag: 1.6))
        XCTAssertEqual(c1-c2, Complex(real:-1.2, imag: 2.4))
        XCTAssertEqual(c1*c2, Complex(real:3.33, imag: 4.16))
        XCTAssertEqual(c1/c2, Complex(real:0.317431, imag: 0.924771))
        XCTAssertEqual(c2/c1, Complex(real:0.332054, imag: -0.96737))

        XCTAssertEqual(c2.conjugate(), Complex(real: 2.3, imag: 0.4))
        XCTAssertEqual(c2.modulus(), 2.33452350598575)
        XCTAssertEqual(c2.norm(),    2.33452350598575)
        XCTAssertEqualWithAccuracy (c2.arg(), -0.172190814522939, accuracy:0.0001)
    }

    func testComplexTrigonometricFunctions() {
        var c1 = Complex(real: 1.1, imag: 2.0)
        var cosc1 = cos(value: c1)
        var sinc1 = sin(value: c1)
        var tanc1 = tan(value: c1)
        XCTAssertEqualWithAccuracy(cosc1.real(), 1.706517373519555, accuracy:1E-15)
        XCTAssertEqualWithAccuracy(cosc1.imag(), -3.232284689388683, accuracy:1E-15)
        XCTAssertEqualWithAccuracy(sinc1.real(), 3.352896489885151, accuracy:1E-15)
        XCTAssertEqualWithAccuracy(sinc1.imag(), 1.645129813951395, accuracy:1E-15)
        XCTAssertEqualWithAccuracy(tanc1.real(), 0.030258402753794, accuracy:1E-15)
        XCTAssertEqualWithAccuracy(tanc1.imag(), 1.021339491143403, accuracy:1E-15)

        c1 = Complex(real: 2.3, imag: -0.4)
        cosc1 = cos(value: c1)
        sinc1 = sin(value: c1)
        tanc1 = tan(value: c1)
        XCTAssertEqualWithAccuracy(cosc1.real(), -0.720292598624068, accuracy:1E-15)
        XCTAssertEqualWithAccuracy(cosc1.imag(), 0.306300150264870, accuracy:1E-15)
        XCTAssertEqualWithAccuracy(sinc1.real(), 0.806161302420185, accuracy:1E-15)
        XCTAssertEqualWithAccuracy(sinc1.imag(), 0.273674425367334, accuracy:1E-15)
        XCTAssertEqualWithAccuracy(tanc1.real(), -0.810989358799874, accuracy:1E-15)
        XCTAssertEqualWithAccuracy(tanc1.imag(), -0.724817371201988, accuracy:1E-15)
    }

    func testComplexHyperbolicFunctions() {
//        var c1 = Complex(real: 1.1, imag: 2.0)
//        var coshc1 = cosh(value: c1)
//        var sinhc1 = sinh(value: c1)
//        var tanhc1 = tanh(value: c1)
//        XCTAssertEqualWithAccuracy(coshc1.real(), -0.694348717893345, accuracy:1E-15)
//        XCTAssertEqualWithAccuracy(coshc1.imag(), 1.214500807730146, accuracy:1E-15)
//        XCTAssertEqualWithAccuracy(sinhc1.real(), -0.555825469434370, accuracy:1E-15)
//        XCTAssertEqualWithAccuracy(sinhc1.imag(), 1.517179627601486, accuracy:1E-15)
//        XCTAssertEqualWithAccuracy(tanhc1.real(), 1.138682614230718, accuracy:1E-15)
//        XCTAssertEqualWithAccuracy(tanhc1.imag(), -0.193344740777106, accuracy:1E-15)
//
//        c1 = Complex(real: 2.3, imag: -0.4)
//        coshc1 = cosh(value: c1)
//        sinhc1 = sinh(value: c1)
//        tanhc1 = tanh(value: c1)
//        XCTAssertEqualWithAccuracy(coshc1.real(), 4.639587458227343, accuracy:1E-15)
//        XCTAssertEqualWithAccuracy(coshc1.imag(), -1.922543482356829, accuracy:1E-15)
//        XCTAssertEqualWithAccuracy(sinhc1.real(), 4.547242947970438, accuracy:1E-15)
//        XCTAssertEqualWithAccuracy(sinhc1.imag(), -1.961586115081145, accuracy:1E-15)
//        XCTAssertEqualWithAccuracy(tanhc1.real(), 0.985989214178122, accuracy:1E-15)
//        XCTAssertEqualWithAccuracy(tanhc1.imag(), -0.014220871636306, accuracy:1E-15)
    }

    func testArcFunctions() {
        var c1 = Complex(real: 1.1, imag: 2.0)
        var acosc1 = acos(value: c1)
        var asinc1 = asin(value: c1)
        var atanc1 = atan(value: c1)
        XCTAssertEqualWithAccuracy(acosc1.real(), 1.105429353067930, accuracy:1E-15)
        XCTAssertEqualWithAccuracy(acosc1.imag(), -1.545271475519208, accuracy:1E-15)
        XCTAssertEqualWithAccuracy(asinc1.real(), 0.465366973726966, accuracy:1E-15)
        XCTAssertEqualWithAccuracy(asinc1.imag(), 1.545271475519210, accuracy:1E-15)
        XCTAssertEqualWithAccuracy(atanc1.real(), 1.330028090459457, accuracy:1E-15)
        XCTAssertEqualWithAccuracy(atanc1.imag(), 0.382593779161728, accuracy:1E-15)
        var acoshc1 = acosh(value: c1)
        var asinhc1 = asinh(value: c1)
        var atanhc1 = atanh(value: c1)
        XCTAssertEqualWithAccuracy(acoshc1.real(), 1.545271475519208, accuracy:1E-15)
        XCTAssertEqualWithAccuracy(acoshc1.imag(), 1.105429353067930, accuracy:1E-15)
        XCTAssertEqualWithAccuracy(asinhc1.real(), 1.494605773235711, accuracy:1E-15)
        XCTAssertEqualWithAccuracy(asinhc1.imag(), 1.024300928663079, accuracy:1E-15)
        XCTAssertEqualWithAccuracy(atanhc1.real(), 0.185157558166595, accuracy:1E-15)
        XCTAssertEqualWithAccuracy(atanhc1.imag(), 1.190883738370785, accuracy:1E-15)

        c1 = Complex(real: 2.3, imag: -0.4)
        acosc1 = acos(value: c1)
        asinc1 = asin(value: c1)
        atanc1 = atan(value: c1)
        XCTAssertEqualWithAccuracy(acosc1.real(), 0.190003953676110, accuracy:1E-15)
        XCTAssertEqualWithAccuracy(acosc1.imag(), 1.495169029335947, accuracy:1E-15)
        XCTAssertEqualWithAccuracy(asinc1.real(), 1.380792373118787, accuracy:1E-15)
        XCTAssertEqualWithAccuracy(asinc1.imag(), -1.495169029335947, accuracy:1E-15)
        XCTAssertEqualWithAccuracy(atanc1.real(), 1.169810711039864, accuracy:1E-15)
        XCTAssertEqualWithAccuracy(atanc1.imag(), -0.062336480927059, accuracy:1E-15)
        acoshc1 = acosh(value: c1)
        asinhc1 = asinh(value: c1)
        atanhc1 = atanh(value: c1)
        XCTAssertEqualWithAccuracy(acoshc1.real(), 1.495169029335947, accuracy:1E-15)
        XCTAssertEqualWithAccuracy(acoshc1.imag(), -0.190003953676110, accuracy:1E-15)
        XCTAssertEqualWithAccuracy(asinhc1.real(), 1.581853237015094, accuracy:1E-15)
        XCTAssertEqualWithAccuracy(asinhc1.imag(), -0.158467170949428, accuracy:1E-15)
        XCTAssertEqualWithAccuracy(atanhc1.real(), 0.446811197218382, accuracy:1E-15)
        XCTAssertEqualWithAccuracy(atanhc1.imag(), -1.481858695291858, accuracy:1E-15)
    }

    func testComplexExponentialFunctions() {
//        var c1 = Complex(real: 1.1, imag: 2.0)
//        var expc1 = exp(value: c1)
//        var logc1 = log(value: c1)
//        var log10c1 = log10(value: c1)
//        XCTAssertEqualWithAccuracy(expc1.real(), -1.250174187327715, accuracy:1E-15)
//        XCTAssertEqualWithAccuracy(expc1.imag(), 2.731680435331631, accuracy:1E-15)
//        XCTAssertEqualWithAccuracy(logc1.real(), 0.825289927882638, accuracy:1E-15)
//        XCTAssertEqualWithAccuracy(logc1.imag(), 1.067953115867036, accuracy:1E-15)
//        XCTAssertEqualWithAccuracy(log10c1.real(), 0.358418861649762, accuracy:1E-15)
//        XCTAssertEqualWithAccuracy(log10c1.imag(), 0.463806145152438, accuracy:1E-15)
//
//        c1 = Complex(real: 2.3, imag: -0.4)
//        expc1 = exp(value: c1)
//        logc1 = log(value: c1)
//        log10c1 = log10(value: c1)
//        XCTAssertEqualWithAccuracy(expc1.real(), 9.186830406197782, accuracy:1E-15)
//        XCTAssertEqualWithAccuracy(expc1.imag(), -3.884129597437974, accuracy:1E-15)
//        XCTAssertEqualWithAccuracy(logc1.real(), 0.847807804337576, accuracy:1E-15)
//        XCTAssertEqualWithAccuracy(logc1.imag(), -0.172190814522939, accuracy:1E-15)
//        XCTAssertEqualWithAccuracy(log10c1.real(), 0.368198251138321, accuracy:1E-15)
//        XCTAssertEqualWithAccuracy(log10c1.imag(), -0.074781520581739, accuracy:1E-15)
    }

    func testComplexPowerFunctions() {

//        var c1 = Complex(real: 1.1, imag: 2.0)
//        var sqrtc1 = sqrt(value: c1)
//        XCTAssertEqualWithAccuracy(sqrtc1.real(), 1.300488839264426, accuracy:1E-15)
//        XCTAssertEqualWithAccuracy(sqrtc1.imag(), 0.768941623955507, accuracy:1E-15)
//        c1 = Complex(real: 2.3, imag: -0.4)
//        sqrtc1 = sqrt(value: c1)
//        XCTAssertEqualWithAccuracy(sqrtc1.real(), 1.522255482168770, accuracy:1E-15)
//        XCTAssertEqualWithAccuracy(sqrtc1.imag(), -0.131383990626237, accuracy:1E-15)
    }
}

#if os(Linux)
extension ComplexTests {
        static var allTests : [(String, (ComplexTests) -> () throws -> Void)] {
        return [
            ("testing Complex operations", testComplexInit),
            ("testing Complex operations", testComplexOperations),
            ("testing Complex operations", testComplexTrigonometricFunctions),
            ("testing Complex operations", testComplexHyperbolicFunctions),
            ("testing Complex operations", testComplexExponentialFunctions),
            ("testing Complex operations", testComplexPowerFunctions),
            ("testing Complex operations", testArcFunctions)
        ]
    }

}
#endif 

