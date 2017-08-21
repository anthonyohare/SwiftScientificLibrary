//
//  Complex.swift
//
// See LICENSE.txt for license information

import Foundation

/// A complex number type.
/// - SeeAlso https://en.wikipedia.org/wiki/Complex_number
/// - SeeAlso http://lithium3141.com/blog/2014/12/14/learning-swift-convertibles for the inspiration
///        for this class

public class Complex: NumericType, ExpressibleByFloatLiteral {

    /// The real and imaginery components of the complex number.
    internal var components: [Double] = [0.0, 0.0]

    /// A string description of the complex number.
    public var description: String {
        return "\(components[0]) \(components[1].signStr) \(fabs(components[1]))i"
    }

    /// Create the complex number instance. The real and imaginery parts of self will be initialised
    /// to 0.0.
    public init() {
        self.components[0] = 0.0
        self.components[1] = 0.0
    }

    /// Create the complex number instance. The imaginery part of the complex number will be set
    ///     to 0.0.
    /// - Parameter value: The [integer] value for the real part of the complex number.
    public required init(integerLiteral value: IntegerLiteralType) {
        self.components[0] = Double(value)
        self.components[1] = 0.0
    }

    /// Create the complex number instance. The imaginery part of the complex number will be set
    ///     to 0.0.
    /// - Parameter value: The [float] value for the real part of the complex number.
    public required init(floatLiteral value: FloatLiteralType) {
        self.components[0] = value
        self.components[1] = 0.0
    }

    /// Create the complex number instance. The imaginery part of the complex number will be set
    ///     to 0.0.
    /// - Parameter value: The [integer] value for the real part of the complex number.
    public required init(_ value: UInt64) {
        self.components[0] = Double(value)
        self.components[1] = 0.0
    }

    /// Create the complex number instance. The imaginery part of the complex number will be set
    ///     to 0.0.
    /// - Parameter value: The [integer] value for the real part of the complex number.
    public required init(_ value: Int) {
        self.components[0] = Double(value)
        self.components[1] = 0.0
    }

    /// Create the complex number instance. The imaginery part of the complex number will be set
    ///     to 0.0.
    /// - Parameter value: The [float] value for the real part of the complex number.
    public required init(_ value: Double) {
        self.components[0] = value
        self.components[1] = 0.0
    }

    /// Create a copy of a complex number.
    ///
    /// - Parameter value: The complex number to be copied.
    public required init(_ value: Complex) {
        self.components[0] = value.real()
        self.components[1] = value.imag()
    }

    /// Create the complex number instance.
    ///
    /// - Parameters:
    ///   - real: <#real description#>
    ///   - imag: <#imag description#>
    public required init(real: Double, imag: Double) {
        self.components[0] = real
        self.components[1] = imag
    }

    /// Create the complex number instance.
    ///
    /// - Parameters:
    ///   - modulus: <#modulus description#>
    ///   - arg: <#arg description#>
    public required init(modulus: Double, arg: Double) {
        self.components[0] = modulus * cos(arg)
        self.components[1] = modulus * sin(arg)
    }

    /// Compute the real part of self.
    ///
    /// - Returns: The real part of self.
    public func real() -> Double {
        return components[0]
    }

    /// Compute the imaginery part of self.
    ///
    /// - Returns: The imaginery part of self.
    public func imag() -> Double {
        return components[1]
    }

    /// Compute the conjugate of the complex number.
    /// - SeeAlso https://en.wikipedia.org/wiki/Complex_conjugate
    ///
    /// - Returns: The conjugate of self.
    public func conjugate() -> Complex {
        return Complex(real: components[0], imag: -components[1])
    }

    /// Compute the modulus of the complex number.
    /// - SeeAlso https://en.wikipedia.org/wiki/Absolute_value#Complex_numbers1
    ///
    /// - Returns: The modulus of self.
    public func modulus() -> Double {
        return sqrt(components[0] * components[0] + components[1] * components[1])
    }

    /// Compute the argument (the angle the complex number
    ///            makes with the positive real axes) of the complex number.
    ///
    /// - SeeAlso https://en.wikipedia.org/wiki/Argument_(complex_analysis)
    ///
    /// - Returns: The argument of self.
    public func arg() -> Double {
        return atan2(components[1], components[0])
    }

    /// Compute the Euclidean norm of the complex number.
    /// - SeeAlso https://en.wikipedia.org/wiki/Norm_(mathematics)#Euclidean_norm_of_a_complex_number
    ///
    /// - Returns: The Euclidean norm of self.
    public func norm() -> Double {
        return sqrt(components[0] * components[0] + components[1] * components[1])
    }

    /// Compute the sum of two complex numbers.
    ///
    /// - Parameters:
    ///   - lhs: the left hand complex number.
    ///   - rhs: the right hand complex number.
    /// - Returns: The product of the two numbers.
    public static func + (lhs: Complex, rhs: Complex) -> Self {
        return self.init(real: (rhs.real() + (lhs.real())),
                imag: (rhs.imag() + (lhs.imag())))
    }

    /// Compute the difference of two complex numbers.
    ///
    /// - Parameters:
    ///   - lhs: the left hand complex number.
    ///   - rhs: the right hand complex number.
    /// - Returns: The difference of the two numbers.
    public static func - (lhs: Complex, rhs: Complex) -> Self {
        return self.init(real: (lhs.real() - (rhs.real())),
                imag: (lhs.imag() - (rhs.imag())))
    }

    /// Compute the product of two complex numbers.
    ///
    /// - Parameters:
    ///   - lhs: the left hand complex number.
    ///   - rhs: the right hand complex number.
    /// - Returns: The product of the two numbers.
    public static func * (lhs: Complex, rhs: Complex) -> Self {
        return self.init(real: (lhs.real() * rhs.real() - lhs.imag() * rhs.imag()),
                imag: (lhs.real() * rhs.imag() + lhs.imag() * rhs.real()))
    }

    /// Compute the quotient of two complex numbers.
    ///
    /// - Parameters:
    ///   - lhs: the left hand complex number.
    ///   - rhs: the right hand complex number.
    /// - Returns: the quotient of two numbers.
    public static func / (left: Complex, right: Complex) -> Complex {
        let denominator = pow(right.real(), 2) + pow(right.imag(), 2)
        let numerator = (left * right.conjugate())
        return Complex(real: (numerator.real() / denominator),
                imag: (numerator.imag() / denominator))
    }

    /// Determines if two complex numbers are equal to a given complex number (i.e. both real parts
    ///         and imaginery parts are equal (to within a tolerance).
    ///
    /// - Parameters:
    ///   - lhs: the first complex number
    ///   - rhs: the second complex number
    /// - Returns: True if the numbers are equal, false otherwise.
    public static func == (lhs: Complex, rhs: Complex) -> Bool {
        return (lhs.real().isApproxEqual(to: rhs.real(), accuracy: 0.0001))
            && (lhs.imag().isApproxEqual(to: rhs.imag(), accuracy: 0.0001))
    }

    /// Determine if two doubles are equal within an accuracy (default = Double.ulpOfOne).
    ///
    /// - Parameter right: The 'other' integer to be compared.
    /// - Parameter accuracy: The largest difference between the two double that is acceptable.
    public func isApproxEqual<T: NumericType>(to: T, accuracy: Double=Double.ulpOfOne) -> Bool {

        do {
            let c: Complex = try to.convert()
            return (self.real().isApproxEqual(to: c.real(), accuracy: accuracy))
                    && (self.imag().isApproxEqual(to: c.imag(), accuracy: accuracy))
        } catch {
            assert(false, "Complex.isApproxEqual(): Cannot determine the type of \(to)")
            return false
        }
    }
}
