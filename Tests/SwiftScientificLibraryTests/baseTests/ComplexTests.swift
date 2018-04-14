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
        let c = [Complex(real:-2.92, imag:-1.513), Complex(real:1.467, imag:-0.914), Complex(real:5.236, imag:-6.103), Complex(real:2.687, imag:-4.376)]

        XCTAssertTrue( cos(value: c[0]) == Complex(real:-2.322088504264088, imag:-0.4747417383982914))
        XCTAssertTrue( cos(value: c[1]) == Complex(real:0.14998575523073715, imag:1.041047948303871))
        XCTAssertTrue( cos(value: c[2]) == Complex(real:111.80226793850136, imag:-193.63979640322847))
        XCTAssertTrue( cos(value: c[3]) == Complex(real:-35.72731642006831, imag:17.455561401910007))

        XCTAssertTrue( sin(value: c[0]) == Complex(real:-0.5231486924194233, imag:2.1072256305004813))
        XCTAssertTrue( sin(value: c[1]) == Complex(real:1.4398075525514342, imag:-0.10844668961561627))
        XCTAssertTrue( sin(value: c[2]) == Complex(real:-193.64173295155172, imag:-111.80114984019056))
        XCTAssertTrue( sin(value: c[3]) == Complex(real:17.461083284878605, imag:35.71601803400401))

        XCTAssertTrue( tan(value: c[0]) == Complex(real:0.038168325733110596, imag:-0.9152733515143648))
        XCTAssertTrue( tan(value: c[1]) == Complex(real:0.09315249314343953, imag:-1.3696160756464049))
        XCTAssertTrue( tan(value: c[2]) == Complex(real:-8.66104894224828e-06, imag:-1.0000050001261453))
        XCTAssertTrue( tan(value: c[3]) == Complex(real:-0.0002495049711126401, imag:-0.9998056630775362))

        XCTAssertTrue( sec(value: c[0]) == Complex(real:-0.4133687487380575, imag:0.0845115929108934))
        XCTAssertTrue( sec(value: c[1]) == Complex(real:0.135577088949473, imag:-0.9410377010185264))
        XCTAssertTrue( sec(value: c[2]) == Complex(real:0.002236218984747992, imag:0.0038730966455691723))
        XCTAssertTrue( sec(value: c[3]) == Complex(real:-0.02259595417228864, imag:-0.011039873827959195))

        XCTAssertTrue( csc(value: c[0]) == Complex(real:-0.11097567346555968, imag:-0.4470063423214956))
        XCTAssertTrue( csc(value: c[1]) == Complex(real:0.6906192835095465, imag:0.05201762898701255))
        XCTAssertTrue( csc(value: c[2]) == Complex(real:-0.0038730966472120586, imag:0.0022361742585149964))
        XCTAssertTrue( csc(value: c[3]) == Complex(real:0.011047659006869645, imag:-0.022597589272401568))

        XCTAssertTrue( cot(value: c[0]) == Complex(real:0.045482767578572766, imag:1.0906730729788436))
        XCTAssertTrue( cot(value: c[1]) == Complex(real:0.04943020888152852, imag:0.7267696915256322))
        XCTAssertTrue( cot(value: c[2]) == Complex(real:-8.66096232959324e-06, imag:0.9999949998238431))
        XCTAssertTrue( cot(value: c[3]) == Complex(real:-0.0002496019599010399, imag:1.0001943124076094))
    }

    func testComplexArcTrigonometricFunctions() {
        let c = [Complex(real:-2.92, imag:-1.513), Complex(real:1.467, imag:-0.914), Complex(real:5.236, imag:-6.103), Complex(real:2.687, imag:-4.376)]

        XCTAssertTrue( acos(value: c[0]) == Complex(real:2.643881664915666, imag:1.8706203498401843))
        XCTAssertTrue( acos(value: c[1]) == Complex(real:0.6397606436912576, imag:1.2118255835063634))
        XCTAssertTrue( acos(value: c[2]) == Complex(real:0.8655258298538054, imag:2.778345491428224))
        XCTAssertTrue( acos(value: c[3]) == Complex(real:1.0284695540331985, imag:2.3336141595981506))

        XCTAssertTrue( asin(value: c[0]) == Complex(real:-1.0730853381207694, imag:-1.8706203498401843))
        XCTAssertTrue( asin(value: c[1]) == Complex(real:0.931035683103639, imag:-1.2118255835063634))
        XCTAssertTrue( asin(value: c[2]) == Complex(real:0.7052704969410913, imag:-2.778345491428224))
        XCTAssertTrue( asin(value: c[3]) == Complex(real:0.5423267727616978, imag:-2.3336141595981506))

        XCTAssertTrue( atan(value: c[0]) == Complex(real:-1.3024387827745776, imag:-0.13096657060258973))
        XCTAssertTrue( atan(value: c[1]) == Complex(real:1.0830956967263412, imag:-0.24766360503438992))
        XCTAssertTrue( atan(value: c[2]) == Complex(real:1.4892798458830332, imag:-0.09403860276979104))
        XCTAssertTrue( atan(value: c[3]) == Complex(real:1.4664239804586887, imag:-0.16569757294387968))

        XCTAssertTrue( asec(value: c[0]) == Complex(real:1.84126239441840, imag:-0.144663208841281))
        XCTAssertTrue( asec(value: c[1]) == Complex(real:1.08813078907058, imag:-0.338877928933362))
        XCTAssertTrue( asec(value: c[2]) == Complex(real:1.49009482369111, imag:-0.0945498980184522))
        XCTAssertTrue( asec(value: c[3]) == Complex(real:1.47011622912008, imag:-0.166031053257259))

        XCTAssertTrue( acsc(value: c[0]) == Complex(real:-0.270466067623499, imag:0.144663208841281))
        XCTAssertTrue( acsc(value: c[1]) == Complex(real:0.482665537724316, imag:0.338877928933362))
        XCTAssertTrue( acsc(value: c[2]) == Complex(real:0.0807015031037857, imag:0.0945498980184522))
        XCTAssertTrue( acsc(value: c[3]) == Complex(real:0.100680097674820, imag:0.166031053257259))

        XCTAssertTrue( acot(value: c[0]) == Complex(real:-0.268357544020319, imag:0.130966570602590))
        XCTAssertTrue( acot(value: c[1]) == Complex(real:0.487700630068555, imag:0.247663605034390))
        XCTAssertTrue( acot(value: c[2]) == Complex(real:0.0815164809118634, imag:0.0940386027697910))
        XCTAssertTrue( acot(value: c[3]) == Complex(real:0.104372346336208, imag:0.165697572943880))
    }

    func testComplexHyperbolicFunctions() {
        let c = [Complex(real:-2.92, imag:-1.513), Complex(real:1.467, imag:-0.914), Complex(real:5.236, imag:-6.103), Complex(real:2.687, imag:-4.376)]

        XCTAssertTrue( cosh(value: c[0]) == Complex(real:0.5370686171719449, imag:9.228242323158616))
        XCTAssertTrue( cosh(value: c[1]) == Complex(real:1.3942119495593686, imag:-1.6257162005456451))
        XCTAssertTrue( cosh(value: c[2]) == Complex(real:92.43994182381432, imag:16.837996600974204))
        XCTAssertTrue( cosh(value: c[3]) == Complex(real:-2.435274078499734, imag:6.900040750542661))

        XCTAssertTrue( sinh(value: c[0]) == Complex(real:-0.5339531833055414, imag:-9.282085955072118))
        XCTAssertTrue( sinh(value: c[1]) == Complex(real:1.2534015973939225, imag:-1.8083533307327053))
        XCTAssertTrue( sinh(value: c[2]) == Complex(real:92.43470647591963, imag:16.83895027707073))
        XCTAssertTrue( sinh(value: c[3]) == Complex(real:-2.412800576489373, imag:6.964309667414571))

        XCTAssertTrue( tanh(value: c[0]) == Complex(real:-1.0057953804725623, imag:-0.0006748794217462752))
        XCTAssertTrue( tanh(value: c[1]) == Complex(real:1.0219318700730844, imag:-0.10542309133660607))
        XCTAssertTrue( tanh(value: c[2]) == Complex(real:0.9999470024660224, imag:1.9970246162858672e-05))
        XCTAssertTrue( tanh(value: c[3]) == Complex(real:1.0072603821616468, imag:-0.005819461643826271))

        XCTAssertTrue( sech(value: c[0]) == Complex(real:0.00628526081657032, imag:-0.107997205617760))
        XCTAssertTrue( sech(value: c[1]) == Complex(real:0.303963109536696, imag:0.354435171566427))
        XCTAssertTrue( sech(value: c[2]) == Complex(real:0.0104704373740067, imag:-0.00190719709939085))
        XCTAssertTrue( sech(value: c[3]) == Complex(real:-0.0454841807304537, imag:-0.128873666958473))

        XCTAssertTrue( csch(value: c[0]) == Complex(real:-0.00617699485534358, imag:0.107379071768786))
        XCTAssertTrue( csch(value: c[1]) == Complex(real:0.258905363149124, imag:0.373537401554895))
        XCTAssertTrue( csch(value: c[2]) == Complex(real:0.0104709542153681, imag:-0.00190750730010704))
        XCTAssertTrue( csch(value: c[3]) == Complex(real:-0.0444156433393515, imag:-0.128201351287287))

        XCTAssertTrue( coth(value: c[0]) == Complex(real:-0.994237564803433, imag:0.000667124234054155))
        XCTAssertTrue( coth(value: c[1]) == Complex(real:0.968234756325033, imag:0.0998836655755051))
        XCTAssertTrue( coth(value: c[2]) == Complex(real:1.00005299994399, imag:-1.99723630707772e-5))
        XCTAssertTrue( coth(value: c[3]) == Complex(real:0.992758813061129, imag:0.00573567861547500))
    }

    func testComplexArcHyperbolicFunctions() {
        let c = [Complex(real:-2.92, imag:-1.513), Complex(real:1.467, imag:-0.914), Complex(real:5.236, imag:-6.103), Complex(real:2.687, imag:-4.376)]

        XCTAssertTrue( acosh(value: c[0]) == Complex(real:1.8706203498401843, imag:-2.643881664915666))
        XCTAssertTrue( acosh(value: c[1]) == Complex(real:1.2118255835063634, imag:-0.6397606436912576))
        XCTAssertTrue( acosh(value: c[2]) == Complex(real:2.778345491428224, imag:-0.8655258298538054))
        XCTAssertTrue( acosh(value: c[3]) == Complex(real:2.3336141595981506, imag:-1.0284695540331985))

        XCTAssertTrue( asinh(value: c[0]) == Complex(real:-1.8972012744772637, imag:-0.4599211862645625))
        XCTAssertTrue( asinh(value: c[1]) == Complex(real:1.2819183196912098, imag:-0.4904314435089076))
        XCTAssertTrue( asinh(value: c[2]) == Complex(real:2.7771700565224653, imag:-0.8578835839600156))
        XCTAssertTrue( asinh(value: c[3]) == Complex(real:2.3250416814837234, imag:-1.0115603708883745))

        XCTAssertTrue( atanh(value: c[0]) == Complex(real:-0.2708429835705937, imag:-1.4212758498161688))
        XCTAssertTrue( atanh(value: c[1]) == Complex(real:0.4706316565189264, imag:-1.1989847880568842))
        XCTAssertTrue( atanh(value: c[2]) == Complex(real:0.08042791198242862, imag:-1.4760805586375034))
        XCTAssertTrue( atanh(value: c[3]) == Complex(real:0.09946722381613049, imag:-1.4046970195996125))

        XCTAssertTrue( asech(value: c[0]) == Complex(real:0.144663208841281, imag:1.84126239441840))
        XCTAssertTrue( asech(value: c[1]) == Complex(real:0.338877928933362, imag:1.08813078907058))
        XCTAssertTrue( asech(value: c[2]) == Complex(real:0.0945498980184522, imag:1.49009482369111))
        XCTAssertTrue( asech(value: c[3]) == Complex(real:0.166031053257259, imag:1.47011622912008))

        XCTAssertTrue( acsch(value: c[0]) == Complex(real:-0.269210791351020, imag:0.135383556086864))
        XCTAssertTrue( acsch(value: c[1]) == Complex(real:0.490461939941105, imag:0.275995332393614))
        XCTAssertTrue( acsch(value: c[2]) == Complex(real:0.0812458114308066, imag:0.0942113091993864))
        XCTAssertTrue( acsch(value: c[3]) == Complex(real:0.103133031305136, imag:0.165830615768352))

        XCTAssertTrue( acoth(value: c[0]) == Complex(real:-0.270842983570594, imag:0.149520476978728))
        XCTAssertTrue( acoth(value: c[1]) == Complex(real:0.470631656518926, imag:0.371811538738012))
        XCTAssertTrue( acoth(value: c[2]) == Complex(real:0.0804279119824286, imag:0.0947157681573932))
        XCTAssertTrue( acoth(value: c[3]) == Complex(real:0.0994672238161305, imag:0.166099307195284))
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

