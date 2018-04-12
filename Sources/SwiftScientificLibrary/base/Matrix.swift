//
//  Matrix.swift
//
//

import Foundation
import CBlas

/// <#Description#>

public class Matrix<T: Numeric> : Equatable {

    private var data: [T]
    private let nRows: Int
    private let nCols: Int

    /// Create a matrix object with all elements set to a value.
    ///
    /// - Parameters:
    ///   - nrows: the number of rows to create.
    ///   - ncols: the number of columns to create.
    ///   - repeatedValue: the value that will be given to each element.
    public init(nrows: Int, ncols: Int, repeatedValue: T) {
        self.nRows = nrows
        self.nCols = ncols
        self.data = [T](repeating: repeatedValue, count: nrows * ncols)
    }

    /// Create a matrix object from a given array. The length of the array must match
    /// the dimension of the matrix and it must be in row major format.
    ///
    /// - Parameters:
    ///   - nrows: the number of rows to create.
    ///   - ncols: the number of columns to create.
    ///   - elements: the values to be placed in the matrix (needs to be nrows*ncols in length)
    public init(nrows: Int, ncols: Int, elements: [T]) {
        assert(elements.count == nrows*ncols,
               "Array \(elements.count) does not contain enough elements \(nrows*ncols) ")
        self.nRows = nrows
        self.nCols = ncols
        self.data = [T](repeating: 0 as T, count: nrows * ncols)
        for i in 0..<(nrows * ncols) {
            self.data[i] = elements[i]
        }
    }

    /// Create a new matrix by copying the contents of the argument.
    ///
    /// - Parameter matrix: the matrix to be copied.
    public init(matrix: Matrix<T>) {
        self.nRows = matrix.nRows
        self.nCols = matrix.nCols
        self.data = [T](repeating: 0 as! T, count: matrix.nRows * matrix.nCols)
        for i in 0..<(nRows * nCols) {
            data[i] = matrix.data[i]
        }
    }

    /// Get the number of rows in the matrix.
    public var numRows: Int {
        return nRows
    }

    /// Get the number of columns in the matrix.
    public var numCols: Int {
        return nCols
    }

    /// Determine the size of the matrix (numRows*numCols).
    ///
    /// - Returns: the number of elements in the matrix.
    public func size() -> Int {
        return nRows * nCols
    }

    ///  Subscript operator allowing manipulation of the components of the matrix.
    ///
    /// - Parameters:
    ///   - row: the row index.
    ///   - column: the column index.
    public subscript(row: Int, column: Int) -> T {
        get {
            assert(row < nRows && column < nCols
                    && row >= 0 && column >= 0, "Index [\(row), \(column)] out of range; cannot get")
            return data[(row * nCols) + column]
        }
        set {
            assert(row < nRows && column < nCols, "Index [\(row), \(column)] out of range; cannot set")
            data[(row * nCols) + column] = newValue
        }
    }

    /// Determines if two matrices are equal (i.e. both are the same size and contain the
    /// same data).
    ///
    /// - Parameters:
    ///   - lhs: the first matrix
    ///   - rhs: the second matrix
    /// - Returns: True if the numbers are equal, fa;se otherwise.
    public static func == (lhs: Matrix<T>, rhs: Matrix<T>) -> Bool {
        if lhs.numRows != rhs.numRows {
            return false
        }
        if lhs.numCols != rhs.numCols {
            return false
        }
        if type(of:T.self) == type(of:Complex.self) {
            for i in 0..<lhs.data.count {
                if !( lhs.data[i] == rhs.data[i] ) {
                        return false
                }
            }
        } else if type(of:T.self) == type(of:Double.self){
            for i in 0..<lhs.data.count {
                if !( (lhs.data[i] as! Double).isEqual(to: (rhs.data[i] as! Double), accuracy: 0.00001) ) {
                    return false
                }
            }
        } else {
            for i in 0..<lhs.data.count {
                if !( lhs.data[i] == rhs.data[i] ) {
                    return false
                }
            }
        }
        return true
    }

    private func toColMajorFormat() -> [T] {
        var colMaj: [T]
        colMaj = [T](repeating: 0 as T, count: self.size())
        for i in 0..<self.nCols {
            for j in 0..<self.nRows {
                colMaj[i * self.nRows + j] = self.data[j * self.nCols + i]
            }
        }
        return colMaj
    }

    private func toRowMajorFormat(array: [T]) -> [T] {
        assert(array.count == self.nRows * self.nCols)
        var rowMaj: [T]
        rowMaj = [T](repeating: 0 as T, count: self.size())
        for i in 0..<self.nRows {
            for j in 0..<self.nCols {
                rowMaj[i * self.nRows + j] = array[j * self.nRows + i]
            }
        }

        return rowMaj
    }

    public func transpose() -> Matrix<T> {
        return Matrix<T>(nrows: self.nCols, ncols: self.nRows,
                elements: toColMajorFormat())
    }

    public func inverse() -> Matrix<T> {
        precondition(nRows == nCols, "Matrix must be square")
        if type(of:T.self) == type(of:Double.self) {
            //TODO it only works for Double matrices - need to fix for complex matrices.

            var A = self.toColMajorFormat() as! [Double]
            let N = Int32(self.nRows)

            var ipiv = [Int32](repeating: 0, count: self.size())

            var ret = LAPACKE_dgetrf(LAPACK_COL_MAJOR, N, N, &A, N, &ipiv)

            if ret == 0 {
                ret = LAPACKE_dgetri(LAPACK_COL_MAJOR, N, &A, N, &ipiv)
            }

            if ret < 0 {
                //   ret < 0 illegal argument value
            } else if ret > 0 {
                //   ret > 0 singular matrix
            }

            return Matrix<T>(nrows: self.nRows, ncols: self.nCols,
                    elements: toRowMajorFormat(array: A as! [T]))
        }
        if type(of:T.self) == type(of:Int.self) {
        }
        if type(of:T.self) == type(of:Complex.self) {
        }

        return Matrix<T>(nrows: self.nRows, ncols: self.nCols, repeatedValue: 0 as T)
    }
}
