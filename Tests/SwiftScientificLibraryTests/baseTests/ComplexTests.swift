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

        XCTAssertEqual(c1.real, 1.1)
        XCTAssertEqual(c1.imag, 2.0)
        XCTAssertEqual(c2.real, 2.3)
        XCTAssertEqual(c2.imag, -0.4)
    }


    func testComplexOperations() {

        XCTAssertEqual(c1+c2, c2+c1)
        XCTAssertEqual(c2*c1, c2*c1)

        XCTAssertTrue((c1+c2) == (Complex(real:3.4, imag: 1.6)))
        XCTAssertTrue((c1-c2) == (Complex(real:-1.2, imag: 2.4)))
        XCTAssertTrue((c1*c2) == (Complex(real:3.33, imag: 4.16)))
        XCTAssertTrue((c1/c2) == (Complex(real:0.31743119266055, imag: 0.924770642201835)))
        XCTAssertTrue((c2/c1) == (Complex(real:0.332053742802303, imag: -0.967370441458733)))

        XCTAssertEqual(c2.conjugate(), Complex(real: 2.3, imag: 0.4))
        XCTAssertEqual(c2.modulus(), 2.33452350598575)
        XCTAssertEqual(c2.norm(),    2.33452350598575)
        XCTAssertEqual(c2.arg(), -0.172190814522939, accuracy:0.0001)
    }

    func testComplexTrigonometricFunctions() {
        var c1 = Complex(real: 1.1, imag: 2.0)
        var cosc1 = cos(value: c1)
        var sinc1 = sin(value: c1)
        var tanc1 = tan(value: c1)
        XCTAssertEqual(cosc1.real, 1.706517373519555, accuracy:1E-15)
        XCTAssertEqual(cosc1.imag, -3.232284689388683, accuracy:1E-15)
        XCTAssertEqual(sinc1.real, 3.352896489885151, accuracy:1E-15)
        XCTAssertEqual(sinc1.imag, 1.645129813951395, accuracy:1E-15)
        XCTAssertEqual(tanc1.real, 0.030258402753794, accuracy:1E-15)
        XCTAssertEqual(tanc1.imag, 1.021339491143403, accuracy:1E-15)

        c1 = Complex(real: 2.3, imag: -0.4)
        cosc1 = cos(value: c1)
        sinc1 = sin(value: c1)
        tanc1 = tan(value: c1)
        XCTAssertEqual(cosc1.real, -0.720292598624068, accuracy:1E-15)
        XCTAssertEqual(cosc1.imag, 0.306300150264870, accuracy:1E-15)
        XCTAssertEqual(sinc1.real, 0.806161302420185, accuracy:1E-15)
        XCTAssertEqual(sinc1.imag, 0.273674425367334, accuracy:1E-15)
        XCTAssertEqual(tanc1.real, -0.810989358799874, accuracy:1E-15)
        XCTAssertEqual(tanc1.imag, -0.724817371201988, accuracy:1E-15)
    }

    func testComplexHyperbolicFunctions() {
//        var c1 = Complex(real: 1.1, imag: 2.0)
//        var coshc1 = cosh(value: c1)
//        var sinhc1 = sinh(value: c1)
//        var tanhc1 = tanh(value: c1)
//        XCTAssertEqual(coshc1.real(), -0.694348717893345, accuracy:1E-15)
//        XCTAssertEqual(coshc1.imag(), 1.214500807730146, accuracy:1E-15)
//        XCTAssertEqual(sinhc1.real(), -0.555825469434370, accuracy:1E-15)
//        XCTAssertEqual(sinhc1.imag(), 1.517179627601486, accuracy:1E-15)
//        XCTAssertEqual(tanhc1.real(), 1.138682614230718, accuracy:1E-15)
//        XCTAssertEqual(tanhc1.imag(), -0.193344740777106, accuracy:1E-15)
//
//        c1 = Complex(real: 2.3, imag: -0.4)
//        coshc1 = cosh(value: c1)
//        sinhc1 = sinh(value: c1)
//        tanhc1 = tanh(value: c1)
//        XCTAssertEqual(coshc1.real(), 4.639587458227343, accuracy:1E-15)
//        XCTAssertEqual(coshc1.imag(), -1.922543482356829, accuracy:1E-15)
//        XCTAssertEqual(sinhc1.real(), 4.547242947970438, accuracy:1E-15)
//        XCTAssertEqual(sinhc1.imag(), -1.961586115081145, accuracy:1E-15)
//        XCTAssertEqual(tanhc1.real(), 0.985989214178122, accuracy:1E-15)
//        XCTAssertEqual(tanhc1.imag(), -0.014220871636306, accuracy:1E-15)
    }

    func testArcFunctions() {
        var c1 = Complex(real: 1.1, imag: 2.0)
//        var acosc1 = acos(value: c1)
//        var asinc1 = asin(value: c1)
        var atanc1 = atan(value: c1)
//        XCTAssertEqual(acosc1.real, 1.105429353067930, accuracy:1E-15)
//        XCTAssertEqual(acosc1.imag, -1.545271475519208, accuracy:1E-15)
//        XCTAssertEqual(asinc1.real, 0.465366973726966, accuracy:1E-15)
//        XCTAssertEqual(asinc1.imag, 1.545271475519210, accuracy:1E-15)
        XCTAssertEqual(atanc1.real, 1.330028090459457, accuracy:1E-15)
        XCTAssertEqual(atanc1.imag, 0.382593779161728, accuracy:1E-15)
//        var acoshc1 = acosh(value: c1)
//        var asinhc1 = asinh(value: c1)
        var atanhc1 = atanh(value: c1)
//        XCTAssertEqual(acoshc1.real, 1.545271475519208, accuracy:1E-15)
//        XCTAssertEqual(acoshc1.imag, 1.105429353067930, accuracy:1E-15)
//        XCTAssertEqual(asinhc1.real, 1.494605773235711, accuracy:1E-15)
//        XCTAssertEqual(asinhc1.imag, 1.024300928663079, accuracy:1E-15)
        XCTAssertEqual(atanhc1.real, 0.185157558166595, accuracy:1E-15)
        XCTAssertEqual(atanhc1.imag, 1.190883738370785, accuracy:1E-15)

        c1 = Complex(real: 2.3, imag: -0.4)
//        acosc1 = acos(value: c1)
//        asinc1 = asin(value: c1)
        atanc1 = atan(value: c1)
//        XCTAssertEqual(acosc1.real, 0.190003953676110, accuracy:1E-15)
//        XCTAssertEqual(acosc1.imag, 1.495169029335947, accuracy:1E-15)
//        XCTAssertEqual(asinc1.real, 1.380792373118787, accuracy:1E-15)
//        XCTAssertEqual(asinc1.imag, -1.495169029335947, accuracy:1E-15)
        XCTAssertEqual(atanc1.real, 1.169810711039864, accuracy:1E-15)
        XCTAssertEqual(atanc1.imag, -0.062336480927059, accuracy:1E-15)
//        acoshc1 = acosh(value: c1)
//        asinhc1 = asinh(value: c1)
        atanhc1 = atanh(value: c1)
//        XCTAssertEqual(acoshc1.real, 1.495169029335947, accuracy:1E-15)
//        XCTAssertEqual(acoshc1.imag, -0.190003953676110, accuracy:1E-15)
//        XCTAssertEqual(asinhc1.real, 1.581853237015094, accuracy:1E-15)
//        XCTAssertEqual(asinhc1.imag, -0.158467170949428, accuracy:1E-15)
        XCTAssertEqual(atanhc1.real, 0.446811197218382, accuracy:1E-15)
        XCTAssertEqual(atanhc1.imag, -1.481858695291858, accuracy:1E-15)
    }

    func testComplexExponentialFunctions() {
        let c = [Complex(real:-2.118, imag:-3.015), Complex(real:0.451, imag:-0.996), Complex(real:9.354, imag:0.46), Complex(real:-0.446, imag:2.085)]

        XCTAssertEqual(exp(value: c[0]).real, -0.119309497383, accuracy:1E-6)
        XCTAssertEqual(exp(value: c[0]).imag, -0.0151849089324, accuracy:1E-6)
        XCTAssertEqual(exp(value: c[1]).real, 0.853487715083, accuracy:1E-6)
        XCTAssertEqual(exp(value: c[1]).imag, -1.31760614755, accuracy:1E-6)
        XCTAssertEqual(exp(value: c[2]).real, 10344.8462029, accuracy:1E-6)
        XCTAssertEqual(exp(value: c[2]).imag, 5125.34131796, accuracy:1E-6)
        XCTAssertEqual(exp(value: c[3]).real, -0.314869046293, accuracy:1E-6)
        XCTAssertEqual(exp(value: c[3]).imag, 0.557398193124, accuracy:1E-6)

        XCTAssertEqual(log(value: c[0]).real, 1.30415725156, accuracy:1E-6)
        XCTAssertEqual(log(value: c[0]).imag, -2.18318984567, accuracy:1E-6)
        XCTAssertEqual(log(value: c[1]).real, 0.089247539244, accuracy:1E-6)
        XCTAssertEqual(log(value: c[1]).imag, -1.14560702812, accuracy:1E-6)
        XCTAssertEqual(log(value: c[2]).real, 2.23701177949, accuracy:1E-6)
        XCTAssertEqual(log(value: c[2]).imag, 0.0491372377536, accuracy:1E-6)
        XCTAssertEqual(log(value: c[3]).real, 0.757139370614, accuracy:1E-6)
        XCTAssertEqual(log(value: c[3]).imag, 1.78152933509, accuracy:1E-6)

        XCTAssertEqual(sqrt(value: c[0]).real, 0.885037459279, accuracy:1E-6)
        XCTAssertEqual(sqrt(value: c[0]).imag, -1.7033177344, accuracy:1E-6)
        XCTAssertEqual(sqrt(value: c[1]).real, 0.878735247437, accuracy:1E-6)
        XCTAssertEqual(sqrt(value: c[1]).imag, -0.566723596729, accuracy:1E-6)
        XCTAssertEqual(sqrt(value: c[2]).real, 3.05935482081, accuracy:1E-6)
        XCTAssertEqual(sqrt(value: c[2]).imag, 0.0751792497019, accuracy:1E-6)
        XCTAssertEqual(sqrt(value: c[3]).real, 0.918196097067, accuracy:1E-6)
        XCTAssertEqual(sqrt(value: c[3]).imag, 1.13537838304, accuracy:1E-6)
        XCTAssertEqual(sqrt(value: Complex(real:4.0, imag:0.0)).real, 2.0, accuracy:1E-6)
        XCTAssertEqual(sqrt(value: Complex(real:4.0, imag:0.0)).imag, 0.0, accuracy:1E-6)
    }

    func testComplexPowerFunctions() {
        let c = [Complex(real:-0.975, imag:5.717), Complex(real:6.463, imag:-3.515), Complex(real:-3.482, imag:5.562), Complex(real:6.289, imag:-2.714)]

        XCTAssertTrue( c[0].toPower(of: Complex(real:1.205, imag:-1.92)) == Complex(real:67.6160378186, imag:-224.766041999))
        XCTAssertTrue( c[0].toPower(of: Complex(real:-4.273, imag:-4.581)) == Complex(real:-1.54318428343, imag:-0.347960431657))
        XCTAssertTrue( c[0].toPower(of: Complex(real:0.0, imag:0.0)) == Complex(real:1.0, imag:0.0))
        XCTAssertTrue( c[0].toPower(of: Complex(real:0.5, imag:0.0)) == Complex(real:1.55314910624, imag:1.84045433147))
        XCTAssertTrue( c[0].toPower(of: Complex(real:0.0, imag:1.0)) == Complex(real:-0.0326377219416, imag:0.172510133708))
        XCTAssertTrue( c[1].toPower(of: Complex(real:1.205, imag:-1.92)) == Complex(real:-1.17825610093, imag:4.08983159973))
        XCTAssertTrue( c[1].toPower(of: Complex(real:-4.273, imag:-4.581)) == Complex(real:1.50543379038e-05, imag:-1.34841383055e-05))
        XCTAssertTrue( c[1].toPower(of: Complex(real:0.0, imag:0.0)) == Complex(real:1.0, imag:0.0))
        XCTAssertTrue( c[1].toPower(of: Complex(real:0.5, imag:0.0)) == Complex(real:2.62868882283, imag:-0.668584270887))
        XCTAssertTrue( c[1].toPower(of: Complex(real:0.0, imag:1.0)) == Complex(real:-0.678311810049, imag:1.49932592895))
        XCTAssertTrue( c[2].toPower(of: Complex(real:1.205, imag:-1.92)) == Complex(real:289.16667275, imag:-498.637660753))
        XCTAssertTrue( c[2].toPower(of: Complex(real:-4.273, imag:-4.581)) == Complex(real:2.38502987429, imag:5.04574722133))
        XCTAssertTrue( c[2].toPower(of: Complex(real:0.0, imag:0.0)) == Complex(real:1.0, imag:0.0))
        XCTAssertTrue( c[2].toPower(of: Complex(real:0.5, imag:0.0)) == Complex(real:1.24097233804, imag:2.24098468174))
        XCTAssertTrue( c[2].toPower(of: Complex(real:0.0, imag:1.0)) == Complex(real:-0.0363042135146, imag:0.113138805868))
        XCTAssertTrue( c[3].toPower(of: Complex(real:1.205, imag:-1.92)) == Complex(real:-2.3377506765, imag:4.01732761722))
        XCTAssertTrue( c[3].toPower(of: Complex(real:-4.273, imag:-4.581)) == Complex(real:2.92302294511e-05, imag:-2.95425144035e-05))
        XCTAssertTrue( c[3].toPower(of: Complex(real:0.0, imag:0.0)) == Complex(real:1.0, imag:0.0))
        XCTAssertTrue( c[3].toPower(of: Complex(real:0.5, imag:0.0)) == Complex(real:2.56306668548, imag:-0.529443891449))
        XCTAssertTrue( c[3].toPower(of: Complex(real:0.0, imag:1.0)) == Complex(real:-0.520137455546, imag:1.41003356624))

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

