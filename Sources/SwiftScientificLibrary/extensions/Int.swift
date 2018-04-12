import Foundation

// Extensions to Int to allow casting from floating points and complex numbers.
extension Int {
    
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
        if value.imag != 0 {
            throw Error.integerCastError
        }
        
        // Check if the real part is an integer, fail if not
        if value.real.truncatingRemainder(dividingBy: 1) != 0 {
            throw Error.integerCastError
        }
        
        self =  Int(value.real)
    }
}
