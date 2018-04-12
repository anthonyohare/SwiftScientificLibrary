import XCTest
import SwiftScientificLibrary

class MatrixTests: XCTestCase {
    
    func testMatrixOperations() {
        //let m1 = Matrix<Double>(nrows:4, ncols:4, repeatedValue:0.0)
    }

    func testMatrixEquals() {
        let A = [1, 0, 0, 0, 1, 0, 0, 0, 1]
        let B = [1, 2, 0, 0, 1, 0, 0, 0, 1]
        let C = [1, 0, 0, 1]
        let m1 = Matrix<Int>(nrows: 3, ncols: 3, elements: A)
        let m2 = Matrix<Int>(nrows: 3, ncols: 3, elements: B)
        let m3 = Matrix<Int>(nrows: 2, ncols: 2, elements: C)

        XCTAssertTrue( m1 == m1)
        XCTAssertFalse( m1 == m2)
        XCTAssertFalse( m1 == m3)
    }

    func testMatrixTranspose() {
        var A = [0, 1, 2, 3, 4, 5, 6, 7, 8]
        var m = Matrix<Int>(nrows: 3, ncols: 3, elements: A)

        var B = m.transpose()
        XCTAssertEqual(B[0, 0], 0)
        XCTAssertEqual(B[0, 1], 3)
        XCTAssertEqual(B[0, 2], 6)
        XCTAssertEqual(B[1, 0], 1)
        XCTAssertEqual(B[1, 1], 4)
        XCTAssertEqual(B[1, 2], 7)
        XCTAssertEqual(B[2, 0], 2)
        XCTAssertEqual(B[2, 1], 5)
        XCTAssertEqual(B[2, 2], 8)

        A = [0, 1, 2, 3, 4, 5]
        m = Matrix<Int>(nrows: 2, ncols: 3, elements: A)

        B = m.transpose()
        XCTAssertEqual(B.numRows, 3)
        XCTAssertEqual(B.numCols, 2)
        XCTAssertEqual(B[0, 0], 0)
        XCTAssertEqual(B[0, 1], 3)
        XCTAssertEqual(B[1, 0], 1)
        XCTAssertEqual(B[1, 1], 4)
        XCTAssertEqual(B[2, 0], 2)
        XCTAssertEqual(B[2, 1], 5)

        A = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
        m = Matrix<Int>(nrows: 3, ncols: 4, elements: A)

        B = m.transpose()
        XCTAssertEqual(B.numRows, 4)
        XCTAssertEqual(B.numCols, 3)
        XCTAssertEqual(B[0, 0], 0)
        XCTAssertEqual(B[0, 1], 4)
        XCTAssertEqual(B[0, 2], 8)
        XCTAssertEqual(B[1, 0], 1)
        XCTAssertEqual(B[1, 1], 5)
        XCTAssertEqual(B[1, 2], 9)
        XCTAssertEqual(B[2, 0], 2)
        XCTAssertEqual(B[2, 1], 6)
        XCTAssertEqual(B[2, 2], 10)
        XCTAssertEqual(B[3, 0], 3)
        XCTAssertEqual(B[3, 1], 7)
        XCTAssertEqual(B[3, 2], 11)
    }
    
    
    func testMatrixInverse() {
        let A = [0.378589,   0.971711,   0.016087,   0.037668,   0.312398,
                 0.756377,   0.345708,   0.922947,   0.846671,   0.856103,
                 0.732510,   0.108942,   0.476969,   0.398254,   0.507045,
                 0.162608,   0.227770,   0.533074,   0.807075,   0.180335,
                 0.517006,   0.315992,   0.914848,   0.460825,   0.731980]
        let m = Matrix<Double>(nrows: 5, ncols: 5, elements: A)
        
        let aInverse = [+0.24335255,  -2.67946180,  +3.57538817,  +0.83711880,  +0.34704217,
            +1.02790497,  -1.05086895,  -0.07468137,  +0.71041070,  +0.66708313,
            -0.21087237,  -4.47765165,  +1.73958308,  +1.73999641,  +3.69324020,
            -0.14100897,  +2.34977565,  -0.93725915,  +0.47383541,  -2.15554470,
            -0.26329660,  +6.46315378,  -4.07721533,  -3.37094863,  -2.42580445]
        let mInverse = Matrix<Double>(nrows: 5, ncols: 5, elements: aInverse)
        
        XCTAssertTrue(m.inverse() == mInverse)
        
        //TODO - test complex array
    }
    
}

#if os(Linux)
extension MatrixTests {
    static var allTests : [(String, (MatrixTests) -> () throws -> Void)] {
        return [
            ("testing Matrix operations", testMatrixOperations),
            ("testing Matrix equals operation", testMatrixEquals),
            ("testing Matrix transpose", testMatrixTranspose),
            ("testing Matrix inverse", testMatrixInverse)
        ]
    }

}
#endif
