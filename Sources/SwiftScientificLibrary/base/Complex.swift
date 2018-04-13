import Foundation

public final class Complex : Numeric, ExpressibleByFloatLiteral, CustomStringConvertible {

    public typealias FloatLiteralType = Float64
    public typealias IntegerLiteralType = Int64
    public typealias Magnitude = Double
    
    /// The real part of the complex number.
    private var _real: Double = 0.0
    public var real: Double {
        get {
            return _real
        }
        set {
            _real = newValue
        }
    }
    
    /// The imaginary part of the complex number.
    private var _imag: Double = 0.0
    public var imag: Double {
        get {
            return _imag
        }
        set {
            _imag = newValue
        }
    }
    
    public var magnitude: Double {
        get {
            return sqrt(self.real * self.real + self.imag * imag)
        }
    }
    
    public required init(integerLiteral value: Int64) {
        self.real = Double(value)
        self.imag = 0.0
    }
    
    public required init(floatLiteral value: Float64) {
        self.real = Double(value)
        self.imag = 0.0
    }
    
    public init(real: Double, imag: Double) {
            self.real = real
            self.imag = imag
    }

    // FIXME(integers): implement properly
    public init?<T>(exactly source: T) where T : BinaryInteger {
        fatalError()
    }
    
    /// A string description of the complex number.
    public var description: String {
        if imag.isEqual(to: 0.0) {
            return String(describing: real)
        } else if real == 0 {
            return String(describing: imag) + "i"
        } else {
            return (imag.sign == .minus) ? "\(real)\(imag)i" : "\(real)+\(imag)i"
        }
    }

    /// Compute the difference of two complex numbers.
    ///
    /// - Parameters:
    ///   - lhs: the left hand complex number.
    ///   - rhs: the right hand complex number.
    /// - Returns: The difference of the two numbers.
    public static func - (lhs: Complex, rhs: Complex) -> Complex {
        return self.init(real: (lhs.real - rhs.real),
                         imag: (lhs.imag - rhs.imag))
    }

    /// Compute the sum of two complex numbers.
    ///
    /// - Parameters:
    ///   - lhs: the left hand complex number.
    ///   - rhs: the right hand complex number.
    /// - Returns: The product of the two numbers.
    public static func + (lhs: Complex, rhs: Complex) -> Complex {
        return self.init(real: (rhs.real + lhs.real),
                         imag: (rhs.imag + lhs.imag))
    }

    /// Compute the product of two complex numbers.
    ///
    /// - Parameters:
    ///   - lhs: the left hand complex number.
    ///   - rhs: the right hand complex number.
    /// - Returns: The product of the two numbers.
    public static func * (lhs: Complex, rhs: Complex) -> Complex {
        return self.init(real: (lhs.real * rhs.real - lhs.imag * rhs.imag),
                         imag: (lhs.real * rhs.imag + lhs.imag * rhs.real))
    }
    
    /// Compute the quotient of two complex numbers.
    ///
    /// - Parameters:
    ///   - lhs: the left hand complex number.
    ///   - rhs: the right hand complex number.
    /// - Returns: the quotient of two numbers.
    public static func / (lhs: Complex, rhs: Complex) -> Complex {
        let denominator = rhs.real*rhs.real + rhs.imag*rhs.imag
        let numerator = (lhs * rhs.conjugate())
        return Complex(real: (numerator.real / denominator),
                       imag: (numerator.imag / denominator))
    }
    
    public static func -= (lhs: inout Complex, rhs: Complex) {
        lhs = lhs - rhs
    }
    
    public static func += (lhs: inout Complex, rhs: Complex) {
        lhs = lhs + rhs
    }
    
    public static func *= (lhs: inout Complex, rhs: Complex) {
        lhs = lhs * rhs
    }
    
    /// Determines if two complex numbers are equal to a given complex number (i.e. both real parts
    ///         and imaginery parts are equal (to within a tolerance).
    ///
    /// - Parameters:
    ///   - lhs: the first complex number
    ///   - rhs: the second complex number
    /// - Returns: True if the numbers are equal, false otherwise.
    public static func == (lhs: Complex, rhs: Complex) -> Bool {
        return lhs.real.isEqual(to: rhs.real, accuracy:0.00001) && lhs.imag.isEqual(to: rhs.imag, accuracy:0.00001)
    }
    
    /// Compute the conjugate of the complex number.
    /// - SeeAlso https://en.wikipedia.org/wiki/Complex_conjugate
    ///
    /// - Returns: The conjugate of self.
    public func conjugate() -> Complex {
        return Complex(real: self.real, imag: -self.imag)
    }

    
    /// Compute the principal argument (the angle the complex number
    ///            makes with the positive real axes) of the complex number.
    ///
    /// - SeeAlso https://en.wikipedia.org/wiki/Argument_(complex_analysis)
    /// - SeeAlso http://www.theoretical-physics.net/dev/math/complex.html#argument-function
    ///
    /// - Returns: The argument of self.
    public func arg() -> Double {
        return atan2(self.imag, self.real)
    }

    /// Compute the modulus (absolute value) of the complex number.
    /// - SeeAlso https://en.wikipedia.org/wiki/Absolute_value#Complex_numbers1
    ///
    /// - Returns: The modulus of self.
    public func modulus() -> Double {
        return self.magnitude
    }

    /// Compute the absolute value (modulus) of the complex number.
    /// - SeeAlso https://en.wikipedia.org/wiki/Absolute_value#Complex_numbers1
    ///
    /// - Returns: The modulus of self.
    public func abs() -> Double {
        return self.magnitude
    }

    /// Compute the Euclidean norm of the complex number.
    /// - SeeAlso https://en.wikipedia.org/wiki/Norm_(mathematics)#Euclidean_norm_of_a_complex_number
    ///
    /// - Returns: The Euclidean norm of self.
    public func norm() -> Double {
        return self.magnitude
    }
    
}
