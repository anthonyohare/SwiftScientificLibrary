import Foundation


extension Complex {
    /// Calculate a complex number taken to the power of $a$ given by the formula
    /// $z^a = e^{a\log z}
    /// - SeeAlso http://www.theoretical-physics.net/dev/math/complex.html#power
    ///
    /// - Parameters:
    ///   - of: the power that self will be raised by
    /// - Returns: The value raised to the power of a
    public func toPower(of pow: Complex) -> Complex {
        let isSelfZero = self.real.isZero && self.imag.isZero
        let isAZero = pow.real.isZero && pow.imag.isZero
        return isSelfZero ? (isAZero ? 1 : 0) : exp(value: (pow * log(value: self)))
    }

    /// Calculate a inverse of a complex number.
    ///
    /// - Returns: The inverse of the complex number
    public func inverse() -> Complex {
        return Complex(real: 1.0, imag:0.0) / self
    }
}
