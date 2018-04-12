import Foundation

// Extensions to Double to allow casting from complex numbers.
extension Double {
    
    /// Create a double from a complex number, useful for casting complex numbers to doubles.
    ///
    /// - Parameter value: The number to be cast to double.
    /// - Throws: DoubleCastError if the number cannot be cast.
    public init(_ value: Complex) throws {
        if value.imag != 0.0 {
            throw Error.doubleCastError
        }
        self = value.real
    }

    func isEqual(to other: Double, accuracy: Double = 0.000001) -> Bool {
        return fabs(self - other) < accuracy;
    }

    /// Compute the smallest integer which is greater than this double.
    public var ceil: Double {
        return Foundation.ceil(self)
    }

    /// Compute the largest integer that is smaller than this double.
    public var floor: Double {
        return Foundation.floor(self)
    } 
}
