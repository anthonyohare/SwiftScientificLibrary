//
//  MersenneTwister.swift
//
// See LICENSE.txt for license information

#if os(Linux)

import Glibc

#else

import Darwin.C

#endif

import Foundation

/// Implementation of a 64 bit Mersenne Twister (a popular pseudorandom number generator (PRNG)).
/// - SeeAlso https://en.wikipedia.org/wiki/Mersenne_Twister
///   References:
///      T. Nishimura, ``Tables of 64-bit Mersenne Twisters''
///           ACM Transactions on Modeling and Computer Simulation 10. (2000) 348--357.
///      M. Matsumoto and T. Nishimura, ``Mersenne Twister: a 623-dimensionally
///                                   equidistributed uniform pseudorandom number generator''
///           ACM Transactions on Modeling and Computer Simulation 8. (Jan. 1998) 3--30.

public final class MersenneTwister: Rng {

    private static let stateSpaceSize: Int = 312
    private var index: Int
    private var state = Array(repeating: UInt64(0), count: stateSpaceSize)

    convenience init() {
#if os(Linux)
        // seed the generator on linux with two unsigned 32 bit integers
        self.init(seed: UInt64(random()) + (UInt64(random()) << 32))
#else
        self.init(seed: arc4random(UInt64.self))
#endif
    }

    public init(seed: UInt64) {
        index = MersenneTwister.stateSpaceSize
        state[0] = seed
        for i in 1 ..< MersenneTwister.stateSpaceSize {
            state[i] = 6364136223846793005 &* (state[i &- 1] ^ (state[i &- 1] >> 62)) &+ UInt64(i)
        }
    }

    public func name() -> String {
        return "Mersenne-Twister"
    }

    ///
    /// -SeeAlso http://www.cocoawithlove.com/blog/2016/05/19/random-numbers.html
    public func sample() -> Double {

        if index == MersenneTwister.stateSpaceSize {
            /* generate NN words at one time */
            let mid = MersenneTwister.stateSpaceSize / 2
            let a: UInt64 = 0xB5026F5AA96619E9
            let lowerMask: UInt64 = (1 << 31) - 1
            let upperMask: UInt64 = ~lowerMask
            var (i, j, stateM) = (0, mid, state[mid])

            repeat {
                let x1 = (state[i] & upperMask) | (state[i &+ 1] & lowerMask)
                state[i] = state[i &+ mid] ^ (x1 >> 1) ^ ((state[i &+ 1] & 1) &* a)
                let x2 = (state[j] & upperMask) | (state[j &+ 1] & lowerMask)
                state[j] = state[j &- mid] ^ (x2 >> 1) ^ ((state[j &+ 1] & 1) &* a)
                (i, j) = (i &+ 1, j &+ 1)
            } while i != mid &- 1

            let x3 = (state[mid &- 1] & upperMask) | (stateM & lowerMask)
            state[mid &- 1] = state[MersenneTwister.stateSpaceSize &- 1] ^ (x3 >> 1) ^ ((stateM & 1) &* a)
            let x4 = (state[MersenneTwister.stateSpaceSize &- 1] & upperMask) | (state[0] & lowerMask)
            state[MersenneTwister.stateSpaceSize &- 1] = state[mid &- 1] ^ (x4 >> 1) ^ ((state[0] & 1) &* a)
            index = 0
        }

        var x = state[index]

        x ^= (x >> 29) & 0x5555555555555555
        x ^= (x << 17) & 0x71D67FFFEDA60000
        x ^= (x << 37) & 0xFFF7EEE000000000
        x ^= (x >> 43)

        index = index &+ 1
        return Double(x) / Double(UInt64.max)
    }

}
