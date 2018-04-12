//
//  Vector.swift
//
// See LICENSE.txt for license information

import Foundation

/// A type for mathematical vectors.
public class Vector<T: Numeric> {
    var dimensions: Int
    var components: [T]

    /// Create a vector from an array of component values.
    ///
    /// - Parameter values: An array of components for the vector.
    public init(_ values: [T]) {
        self.dimensions = values.count
        self.components = values
    }

    /// Create a vector of a given dimension with each component equal to zero.
    ///
    /// - Parameter dimensions: The dimension (number of components) of the vector.
    public init(dimensions: Int) {
        self.dimensions = dimensions
        self.components = [T](repeating: 0 as T, count: dimensions)
    }

    /// Create a vector of a given dimension with each component set to a given default.
    ///
    /// - Parameters:
    ///   - dimensions: The dimension (number of components) of the vector.
    ///   - defaultValue: The default value for each of the components.
    public init(dimensions: Int, defaultValue: T) {
        self.dimensions = dimensions
        self.components = [T](repeating: defaultValue, count: dimensions)
    }

    /// Subscript operator allowing manipulation of the components.
    ///
    /// - Parameter index: The index of the component.
    public subscript(index: Int) -> T {
        get {
            return components[index]
        }
        set {
            components[index] = newValue
        }
    }

    /// Calculate the dot (scalar) product of self and another vector.
    ///
    /// - Parameter vector: The vector to be dot'ed with self.
    /// - Returns: The value of the dot product.
    /// - Throws: XXXXCastError if the components of the vector cannot be cast to the correct type.
    public func dot<U>(vector: Vector<U>) throws -> T {
        assert(self.dimensions == vector.dimensions, "Vectors don't have the same dimensions.")
        
        if let _ = vector.components[0] as? T {
            var sum : T = 0
            for i in 0..<self.dimensions {
                let v = vector.components[i] as! T
                sum += self.components[i]*v
            }
            return sum
        }
        throw Error.vectorCastError
    }
}

/// Compute the difference of two vectors
///
/// - Parameters:
///   - lhs: the left hand vector.
///   - rhs: the right hand vector.
/// - Returns: The difference of the two numbers.
public func -<U>(lhs: Vector<U>, rhs: Vector<U>) -> Vector<U> {
    assert(lhs.dimensions == rhs.dimensions, "Vectors don't have the same dimensions.")
    var v = [U]()
    for i in 0 ... lhs.dimensions {
        v.append(lhs[i] - rhs[i])
    }
    return Vector<U>(v)
}

/// Compute the sum of two vectors
///
/// - Parameters:
///   - lhs: the left hand vector.
///   - rhs: the right hand vector.
/// - Returns: The sum of the two numbers.
public func +<U>(lhs: Vector<U>, rhs: Vector<U>) -> Vector<U> {
    assert(lhs.dimensions == rhs.dimensions, "Vectors don't have the same dimensions.")
    var v = [U]()
    for i in 0 ... lhs.dimensions {
        v.append(lhs[i] + rhs[i])
    }
    return Vector<U>(v)
}
