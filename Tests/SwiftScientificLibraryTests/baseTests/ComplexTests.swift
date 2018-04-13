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

        let c = [Complex(real:-3.932, imag:-2.428), Complex(real:7.745, imag:6.735), Complex(real:4.185, imag:-4.414), Complex(real:2.344, imag:6.787)]

        XCTAssertTrue( cos(value: c[0]) == Complex(real:-4.01885203268, imag:3.99662966218))
        XCTAssertTrue( cos(value: c[1]) == Complex(real:45.7548612018, imag:-418.175464441))
        XCTAssertTrue( cos(value: c[2]) == Complex(real:-20.7882603318, imag:-35.682748422))
        XCTAssertTrue( cos(value: c[3]) == Complex(real:-309.493188157, imag:-317.134170446))

        XCTAssertTrue( sin(value: c[0]) == Complex(real:4.05931740023, imag:3.9567891983))
        XCTAssertTrue( sin(value: c[1]) == Complex(real:418.176645965, imag:45.7547319252))
        XCTAssertTrue( sin(value: c[2]) == Complex(real:-35.693210074, imag:20.782167309))
        XCTAssertTrue( sin(value: c[3]) == Complex(real:317.134977979, imag:-309.492400083))

        XCTAssertTrue( tan(value: c[0]) == Complex(real:-0.0155637990077, imag:-1.00003481253))
        XCTAssertTrue( tan(value: c[1]) == Complex(real:6.10975264948e-07, imag:1.00000275858))
        XCTAssertTrue( tan(value: c[2]) == Complex(real:0.000255009216562, imag:-1.00014462042))
        XCTAssertTrue( tan(value: c[3]) == Complex(real:-2.54558467896e-06, imag:1.00000006209))

        XCTAssertTrue( sec(value: c[0]) == Complex(real:-0.125103488676, imag:-0.124411724945))
        XCTAssertTrue( sec(value: c[1]) == Complex(real:0.00025855429731, imag:0.00236305084358))
        XCTAssertTrue( sec(value: c[2]) == Complex(real:-0.0121895946685, imag:0.0209232630812))
        XCTAssertTrue( sec(value: c[3]) == Complex(real:-0.00157615097772, imag:0.00161506408524))

        XCTAssertTrue( csc(value: c[0]) == Complex(real:0.1263237465, imag:-0.123133124701))
        XCTAssertTrue( csc(value: c[1]) == Complex(real:0.00236304448291, imag:-0.000258552140313))
        XCTAssertTrue( csc(value: c[2]) == Complex(real:-0.0209233437875, imag:-0.0121824971852))
        XCTAssertTrue( csc(value: c[3]) == Complex(real:0.00161506799717, imag:0.00157614676856))

        XCTAssertTrue( cot(value: c[0]) == Complex(real:-0.015558946824, imag:0.999723040794))
        XCTAssertTrue( cot(value: c[1]) == Complex(real:6.10971894127e-07, imag:-0.999997241431))
        XCTAssertTrue( cot(value: c[2]) == Complex(real:0.000254935456908, imag:0.999855335493))
        XCTAssertTrue( cot(value: c[3]) == Complex(real:-2.54558436275e-06, imag:-0.9999999379))

    }

    func testComplexArcTrigonometricFunctions() {
        let c = [Complex(real:-4.185, imag:6.652), Complex(real:9.579, imag:-0.926), Complex(real:-0.591, imag:7.111), Complex(real:-0.391, imag:-5.606)]

        XCTAssertTrue( acos(value: c[0]) == Complex(real:2.12873332692, imag:-2.75656932716))
        XCTAssertTrue( acos(value: c[1]) == Complex(real:0.0968915537983, imag:2.95471165666))
        XCTAssertTrue( acos(value: c[2]) == Complex(real:1.65291745891, imag:-2.66304075048))
        XCTAssertTrue( acos(value: c[3]) == Complex(real:1.63935651586, imag:2.42716186611))

        XCTAssertTrue( asin(value: c[0]) == Complex(real:-0.557937000125, imag:2.75656932716))
        XCTAssertTrue( asin(value: c[1]) == Complex(real:1.473904773, imag:-2.95471165666))
        XCTAssertTrue( asin(value: c[2]) == Complex(real:-0.0821211321182, imag:2.66304075048))
        XCTAssertTrue( asin(value: c[3]) == Complex(real:-0.0685601890671, imag:-2.42716186611))

        XCTAssertTrue( atan(value: c[0]) == Complex(real:-1.50235326888, imag:0.107617040128))
        XCTAssertTrue( atan(value: c[1]) == Complex(real:1.46772417539, imag:-0.00989289785458))
        XCTAssertTrue( atan(value: c[2]) == Complex(real:-1.55895855368, imag:0.14056176966))
        XCTAssertTrue( atan(value: c[3]) == Complex(real:-1.55801302699, imag:-0.179388468186))

    }

    func testComplexHyperbolicFunctions() {
        let c = [Complex(real:2.535, imag:5.059), Complex(real:2.159, imag:-6.935), Complex(real:-2.624, imag:7.55), Complex(real:9.357, imag:0.129)]

        XCTAssertTrue( cosh(value: c[0]) == Complex(real:2.15644164344, imag:-5.89578801735))
        XCTAssertTrue( cosh(value: c[1]) == Complex(real:3.48915068703, imag:-2.59244275036))
        XCTAssertTrue( cosh(value: c[2]) == Complex(real:2.07479126082, imag:-6.54465647554))
        XCTAssertTrue( cosh(value: c[3]) == Complex(real:5741.6915847, imag:744.814278929))

        XCTAssertTrue( sinh(value: c[0]) == Complex(real:2.12951546021, imag:-5.97033599384))
        XCTAssertTrue( sinh(value: c[1]) == Complex(real:3.39737730341, imag:-2.66247242967))
        XCTAssertTrue( sinh(value: c[2]) == Complex(real:-2.05308677927, imag:6.61384418701))
        XCTAssertTrue( sinh(value: c[3]) == Complex(real:5741.69149906, imag:744.814290039))

        XCTAssertTrue( tanh(value: c[0]) == Complex(real:1.00967898841, imag:-0.00810720412084))
        XCTAssertTrue( tanh(value: c[1]) == Complex(real:0.992661353288, imag:-0.0255233174967))
        XCTAssertTrue( tanh(value: c[2]) == Complex(real:-1.00865084861, imag:0.00605886447957))
        XCTAssertTrue( tanh(value: c[3]) == Complex(real:0.999999985578, imag:3.80569484802e-09))
    }

    func testComplexArcHyperbolicFunctions() {
        let c = [Complex(real:2.535, imag:5.059), Complex(real:2.159, imag:-6.935), Complex(real:-2.624, imag:7.55), Complex(real:9.357, imag:0.129)]

        XCTAssertTrue( acosh(value: c[0]) == Complex(real:2.4310211389, imag:1.11244652303))
        XCTAssertTrue( acosh(value: c[1]) == Complex(real:2.67987062283, imag:-1.27164613148))
        XCTAssertTrue( acosh(value: c[2]) == Complex(real:2.77477625575, imag:1.9028818709))
        XCTAssertTrue( acosh(value: c[3]) == Complex(real:2.92650087559, imag:0.0138649787513))

        XCTAssertTrue( asinh(value: c[0]) == Complex(real:2.4216766192, imag:1.09993684445))
        XCTAssertTrue( asinh(value: c[1]) == Complex(real:2.67206793393, imag:-1.26626567467))
        XCTAssertTrue( asinh(value: c[2]) == Complex(real:-2.76863711904, imag:1.23385670998))
        XCTAssertTrue( asinh(value: c[3]) == Complex(real:2.93220857222, imag:0.0137075623028))

        XCTAssertTrue( atanh(value: c[0]) == Complex(real:0.0773843452843, imag:1.41314703989))
        XCTAssertTrue( atanh(value: c[1]) == Complex(real:0.0402500465193, imag:-1.43987721801))
        XCTAssertTrue( atanh(value: c[2]) == Complex(real:-0.0405275088846, imag:1.45297189263))
        XCTAssertTrue( atanh(value: c[3]) == Complex(real:0.107260773512, imag:1.56930620916))


    }

    func testComplexExponentialFunctions() {
        let c = [Complex(real:-4.185, imag:6.652), Complex(real:9.579, imag:-0.926), Complex(real:-0.591, imag:7.111), Complex(real:-0.391, imag:-5.606)]

        XCTAssertTrue( exp(value: c[0]) == Complex(real:0.0141985935126, imag:0.00548775874128))
        XCTAssertTrue( exp(value: c[1]) == Complex(real:8689.74615145, imag:-11555.1178733))
        XCTAssertTrue( exp(value: c[2]) == Complex(real:0.374620257903, imag:0.407828956353))
        XCTAssertTrue( exp(value: c[3]) == Complex(real:0.527129769552, imag:0.423821096143))

        XCTAssertTrue( log(value: c[0]) == Complex(real:2.06165490323, imag:2.13236295246))
        XCTAssertTrue( log(value: c[1]) == Complex(real:2.26422402995, imag:-0.0963703477306))
        XCTAssertTrue( log(value: c[2]) == Complex(real:1.96508469959, imag:1.65371643047))
        XCTAssertTrue( log(value: c[3]) == Complex(real:1.72626385685, imag:-1.64043025907))

        XCTAssertTrue( sqrt(value: c[0]) == Complex(real:1.35535325302, imag:2.45397278723))
        XCTAssertTrue( sqrt(value: c[1]) == Complex(real:3.09860081616, imag:-0.1494222804))
        XCTAssertTrue( sqrt(value: c[2]) == Complex(real:1.80893849259, imag:1.96551735428))
        XCTAssertTrue( sqrt(value: c[3]) == Complex(real:1.6168826391, imag:-1.73358284158))

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
            ("testing Complex operations", testComplexArcTrigonometricFunctions),
            ("testing Complex operations", testComplexHyperbolicFunctions),
            ("testing Complex operations", testComplexArcHyperbolicFunctions),
            ("testing Complex operations", testComplexExponentialFunctions),
            ("testing Complex operations", testComplexPowerFunctions)
        ]
    }

}
#endif 

