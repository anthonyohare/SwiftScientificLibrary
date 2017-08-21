//
//  Numeric.swift
//
// See LICENSE.txt for license information

import Foundation

/// A num,ber type for SSL, required because vectors can have generic numeric types.
/// Note however a numeric type does no conform to Comparable as complex numbers are 
/// not comparable.
public protocol NumericType: Equatable, ExpressibleByIntegerLiteral {

    static func + (lhs: Self, rhs: Self) -> Self
    static func - (lhs: Self, rhs: Self) -> Self
    static func * (lhs: Self, rhs: Self) -> Self

    init (_ value: Int) throws
    init (_ value: Double) throws
    init (_ value: Complex) throws

    func isApproxEqual<T: NumericType> (to: T, accuracy: Double) -> Bool
}

// Extension to NumericType to convert between types (e.g. complex numbers and integers).
extension NumericType {
    /// Convert will return a generic type by finding out what type self is, and going
    /// through all of the compatible number types that have initializers. Once we determine
    /// which kind it is, we can call that initializer T.init(x) since T conforms to NumericType.
    /// from https://realm.io/news/richard-fox-casting-swift-2/
    func convert<N: NumericType>() throws -> N {
        switch self {
        case let x as Complex:
            return try N(x)
        case let x as Double:
            return try N(x)
        case let x as Int:
            return try N(x)
        default:
            assert(false, "NumberConvertible convert cast failed!")
            return try N(0)
        }
    }
}

// Simple extension to SignedNumber to return a string representation of its sign.
extension SignedNumber {
    var signStr: String {
        if self < 0 {
            return "-"
        } else {
            return "+"
        }
    }
}

// Extensions to Int to allow casting from floating points and complex numbers.
extension Int: NumericType {

    /// Create an integer from a floating point variable, useful for casting complex numbers
    /// to integers.
    ///
    /// - Parameter value: The number to be cast to integer.
    public init(floatLiteral value: FloatLiteralType) {
        self = Int(value)
    }

    /// Create an integer from a complex number, useful for casting complex numbers to integers.
    ///
    /// - Parameter value: The number to be cast to integer.
    /// - Throws: IntegerCastError if the number cannot be cast.
    public init(_ value: Complex) throws {
        if value.imag() != 0 {
            throw Error.integerCastError
        }

        // Check if the real part is an integer, fail if not
        if value.real().truncatingRemainder(dividingBy: 1) != 0 {
            throw Error.integerCastError
        }

        self =  Int(value.real())
    }

    /// Determine if two integers are equal within an accuracy (default = Double.ulpOfOne).
    ///
    /// - Parameter right: The 'other' integer to be compared.
    /// - Parameter accuracy: The largest difference between the two double that is acceptable.
    public func isApproxEqual<T: NumericType>(to: T, accuracy: Double=Double.ulpOfOne) -> Bool {
        if let i = to as? Int {
            return fabs(Double(self - i)) <= accuracy
        }
        return false
    }
}

// Extensions to Double to allow casting from complex numbers.
extension Double: NumericType {

    /// Create a double from a complex number, useful for casting complex numbers to doubles.
    ///
    /// - Parameter value: The number to be cast to double.
    /// - Throws: DoubleCastError if the number cannot be cast.
    public init(_ value: Complex) throws {
        if value.imag() != 0.0 {
            throw Error.doubleCastError
        }
        self = value.real()
    }

    /// Determine if two doubles are equal within an accuracy (default = Double.ulpOfOne).
    ///
    /// - Parameter right: The 'other' integer to be compared.
    /// - Parameter accuracy: The largest difference between the two double that is acceptable.
    public func isApproxEqual<T: NumericType>(to: T, accuracy: Double=Double.ulpOfOne) -> Bool {
        if let i = to as? Double {
            return fabs(self.distance(to: i)) <= accuracy
        }
        return false
    }

//    /// Determine if a double value is less than or equals self to within a tolerance
//    /// (default = Double.ulpOfOne).
//    ///
//    /// - Parameter right: The 'other' integer to be compared.
//    /// - Parameter accuracy: The largest difference between the two double that is acceptable.
//    public func lessThanOrEquals<T: NumericType> (right: T, accuracy: Double=Double.ulpOfOne) -> Bool {
//        return (self.equalTo (right: Double(right), accuracy: accuracy))
//                || (self.lessThan(right: Double(right), accuracy: accuracy))
//    }
//
//    /// Determine if a double value is greater than or equals self to within a tolerance
//    /// (default = Double.ulpOfOne).
//    ///
//    /// - Parameter right: The 'other' integer to be compared.
//    /// - Parameter accuracy: The largest difference between the two double that is acceptable.
//    public func greaterThanOrEquals<T: NumericType>(right: T, accuracy: Double=Double.ulpOfOne) -> Bool {
//        return (self.equalTo (right: Double(right), accuracy: accuracy))
//                || (self.greaterThan(right: Double(right), accuracy: accuracy))
//    }
//
//    /// Determine if a double value is less than self to within a tolerance
//    /// (default = Double.ulpOfOne).
//    ///
//    /// - Parameter right: The 'other' integer to be compared.
//    /// - Parameter accuracy: The largest difference between the two double that is acceptable.
//    public func lessThan<T: NumericType> (right: T, accuracy: Double=Double.ulpOfOne) -> Bool {
//        return self.distance(to: Double(right)) > accuracy
//    }
//
//    /// Determine if a double value is greater than self to within a tolerance
//    /// (default = Double.ulpOfOne).
//    ///
//    /// - Parameter right: The 'other' integer to be compared.
//    /// - Parameter accuracy: The largest difference between the two double that is acceptable.
//    public func greaterThan<T: NumericType> (right: T, accuracy: Double=Double.ulpOfOne) -> Bool {
//        return self.distance(to: Double(right)) < accuracy
//    }
}
