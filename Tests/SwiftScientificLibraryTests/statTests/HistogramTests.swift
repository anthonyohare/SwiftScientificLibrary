import XCTest
import SwiftScientificLibrary


class HistogramTests: XCTestCase {

    static var allTests: [(String, (HistogramTests) -> () throws -> Void)] {
        return [
                ("testing Histogram constructor,", testHistogramInit),
                ("testing Histogram copy,", testHistogramCopy),
                ("testing Histogram size,", testHistogramGetN),
                ("testing Histogram adding a value,", testHistogramAddValue),
                ("testing Histogram adding an array,", testHistogramAddArray),
                ("testing Histogram adding a histogram,", testHistogramAddValues)
        ]
    }

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testHistogramInit() {
        XCTAssertNil(Histogram(minVal: 11.0, maxVal: 10.0, nBins: 10))
        XCTAssertNil(Histogram(minVal: 11.0, maxVal: 10.0, binWidth: 1.0))

        var h1 = Histogram(minVal: 0, maxVal: 10.0, nBins: 10)
        var h2 = Histogram(minVal: 0, maxVal: 10.0, nBins: 5)

        XCTAssertEqual(h1?.numClasses, 10)
        XCTAssertEqual(h2?.numClasses, 5)
        XCTAssertEqual(h1?.classWidth, 1.0)
        XCTAssertEqual(h2?.classWidth, 2.0)

        h1 = Histogram(minVal: 0, maxVal: 10.0, binWidth: 1.0)
        h2 = Histogram(minVal: 0, maxVal: 10.0, binWidth: 2.0)

        XCTAssertEqual(h1?.numClasses, 10)
        XCTAssertEqual(h2?.numClasses, 5)
        XCTAssertEqual(h1?.classWidth, 1.0)
        XCTAssertEqual(h2?.classWidth, 2.0)
    }

    func testHistogramCopy() {
        let h1 = Histogram(minVal: 5, maxVal: 10.0, nBins: 5)

        let thisCopy = (h1?.copy())!
        XCTAssertEqual(thisCopy.numClasses, h1?.numClasses)
        XCTAssertEqual(thisCopy.numClasses, 5)
        XCTAssertEqual(thisCopy.classWidth, h1?.classWidth)
        XCTAssertEqual(thisCopy.classWidth, 1.0)
        XCTAssertEqual(thisCopy.getN(), h1?.getN())
        XCTAssertEqual(thisCopy.getN(), 0)
        XCTAssertTrue(thisCopy !== h1)
    }

    func testHistogramGetN() {
        let h1 = Histogram(minVal: 0.0, maxVal: 20.0, nBins: 10)!
        XCTAssertEqual(h1.getN(), 0)
    }

    func testHistogramAddValue() {
        var h = Histogram(minVal: 0.0, maxVal: 12.0, nBins: 8)!
        XCTAssertEqual(h.numClasses, 8)
        XCTAssertEqual(h.classWidth, 1.5)
        h.add(value: 3.1)
        h.add(value: 3.5)
        h.add(value: 6.0)
        h.add(value: 1.0)

        XCTAssertEqual(h[0], 1)
        XCTAssertEqual(h[1], 0)
        XCTAssertEqual(h[2], 2)
        XCTAssertEqual(h[3], 0)
        XCTAssertEqual(h[4], 1)
        XCTAssertEqual(h[5], 0)
        XCTAssertEqual(h[6], 0)
        XCTAssertEqual(h[7], 0)

        h = Histogram(minVal: -1.0, maxVal: 4.0, nBins: 10)!
        h.add(value: 3.1)
        h.add(value: 3.5)
        h.add(value: -0.03)
        h.add(value: 1.0)
        h.add(value: -1.0)
        XCTAssertEqual(h.getN(), 5)

        XCTAssertEqual(h[0], 1)
        XCTAssertEqual(h[1], 1)
        XCTAssertEqual(h[2], 0)
        XCTAssertEqual(h[3], 0)
        XCTAssertEqual(h[4], 1)
        XCTAssertEqual(h[5], 0)
        XCTAssertEqual(h[6], 0)
        XCTAssertEqual(h[7], 0)
        XCTAssertEqual(h[8], 1)
        XCTAssertEqual(h[9], 1)

        // these values should not get inserted.
        h.add(value: -1.1)
        h.add(value: 4.0)
        XCTAssertEqual(h.getN(), 5)
    }

    func testHistogramAddValues() {
        let h = Histogram(minVal: 0.0, maxVal: 7.5, binWidth: 1.5)!
        h.add(value: 3.1)
        h.add(value: 3.5)
        h.add(value: 6.0)
        h.add(value: 1.0)

        let h1 = Histogram(minVal: 0.0, maxVal: 7.5, binWidth: 1.0)!
        let h2 = Histogram(minVal: 0.0, maxVal: 7.5, binWidth: 1.5)!
        h1.add(values:h)
        h2.add(values:h)

        // h1 will not contain anything from h as they are different sizes.
        XCTAssertEqual(h1.getN(), 0)
        XCTAssertEqual(h2.getN(), 4)
    }

    func testHistogramAddArray() {
        var h = Histogram(minVal: 0.0, maxVal: 6.0, nBins: 6)!
        h.add(array: [0.5, 2.0, 4.5, 6.0, 3.0, 0.0, 0.5, 5.4, 9.0, 3.0])
        XCTAssertEqual(h.getN(), 8)
        XCTAssertEqual(h[0], 3)
        XCTAssertEqual(h[1], 0)
        XCTAssertEqual(h[2], 1)
        XCTAssertEqual(h[3], 2)
        XCTAssertEqual(h[4], 1)
        XCTAssertEqual(h[5], 1)

        h = Histogram(minVal: 0.0, maxVal: 10.0, nBins: 6)!
        h.add(array: [0.5, 2.0, 4.5, 6.0, 3.0, 0.0, 0.5, 5.4, 9.0, 3.0])
        XCTAssertEqual(h[0], 3)
        XCTAssertEqual(h[1], 3)
        XCTAssertEqual(h[2], 1)
        XCTAssertEqual(h[3], 2)
        XCTAssertEqual(h[4], 0)
        XCTAssertEqual(h[5], 1)
    }
}
