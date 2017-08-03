//
// DoubleExtensions.swift
//
// See LICENSE.txt for license information

import Foundation

// Simple extensions to the Double class
public extension Double {

	/// Compute the smallest integer which is greater than this double.
	public var ceil: Double {
		return Foundation.ceil(self)
	}

	/// Compute the largest integer that is smaller than this double.
	public var floor: Double {
		return Foundation.floor(self)
	}
}
