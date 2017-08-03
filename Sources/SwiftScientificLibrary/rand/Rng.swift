//
//  RNG.swift
//
// See LICENSE.txt for license information

import Foundation

/// A random number generator protocol defining simple access functions.
/// - SeeAlso https://en.wikipedia.org/wiki/Random_number_generation

public protocol Rng {

    init(seed: UInt64)

    func name() -> String

    func sample() -> Double
}

#if os(OSX)
/// A generic version of arc4random that uses arc4random_buf() to create "arbitrary large" 
/// random numbers. The issue with arc4random is that it is limited to 32-bit integer types 
/// (Int is 64-bit on iPhone 5S and modern Macs). This function should only be used to seed 
/// better random number generators.
public func arc4random<T: ExpressibleByIntegerLiteral>(_ type: T.Type) -> T {
    var r: T = 0
    arc4random_buf(&r, MemoryLayout<T>.size)
    return r
}
#endif
