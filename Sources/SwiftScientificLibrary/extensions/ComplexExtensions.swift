import Foundation


extension Complex {
/// Calculate a complex number taken to the power of $a$ given by the formula
/// $z^a = e^{a\log z}
/// - SeeAlso http://www.theoretical-physics.net/dev/math/complex.html#power
///
/// - Parameters:
///   - a: the power that self will be raised by
/// - Returns: The value raised to the power of a
    public func toPower(of a: Complex) -> Complex {
        let isSelfZero = self.real.isZero && self.imag.isZero
        let isAZero = a.real.isZero && a.imag.isZero
        return isSelfZero ? (isAZero ? 1 : 0) : exp(value: (a * log(value: self)))
    }
}
