//
// A simple histogram class for defining custom distributions.
//
// See LICENSE.txt for license information

import Foundation

public class Histogram {

    private var nBins: Int
    private var binWidth: Double
    private var minValue = Double.infinity
    private var maxValue = -Double.infinity
    private var frequencies: [Int]

    public var numClasses: Int {
         return nBins
    }

    public var classWidth: Double {
        return binWidth
    }

    /// Subscript operator allowing manipulation of the components.
    ///
    /// - Parameter index: The index of the component.
    public subscript(index: Int) -> Int? {
        /// Returns the element at the specified index iff it is within bounds, otherwise nil.
        get {
            guard index < nBins else {
                return nil
            }
            return frequencies[index]
        }
        set {
            guard index < nBins else {
                return
            }
            frequencies[index] = newValue!
        }
    }

    ///
    /// Create the histogram with maximum/minimum values and a number of bins. The width of each class
    /// interval is calculated from these values.
    /// @param min the minimum value permissible in the histogram.
    /// @param max the maximum value permissible in the histogram.
    /// @param nBins the number of bins (class intervals) in the histogram.
    ///
    public init!(minVal: Double, maxVal: Double, nBins: Int) {
        guard maxVal > minVal && nBins >= 1 else {
            // there must be at least one class interval!
            return nil
        }
        self.minValue = minVal
        self.maxValue = maxVal
        self.nBins = nBins
        self.binWidth = (maxVal-minVal)/Double(nBins)
        self.frequencies = Array(repeating: 0, count: nBins)
    }

    ///
    /// Create the histogram with maximum/minimum values and bin width (class interval size). The number of bins is
    /// calculated from the values given and the maximum is increased if needed to accomodate the correct number of
    /// bins (e.g. max = min + nBins*binWidth).
    /// @param min the minimum value permissible in the histogram.
    /// @param max the maximum value permissible in the histogram.
    /// @param binWidth the width of each (equally sized) bin (class interval).
    ///
    public init!(minVal: Double, maxVal: Double, binWidth: Double) {
        guard maxVal > minVal && binWidth > 0 else {
            // there must be at least one class interval!
            return nil
        }
        self.minValue = minVal
        self.binWidth = binWidth
        self.nBins = Int(ceil((maxVal-minVal)/binWidth))

        self.maxValue = max(maxVal, minVal + Double(nBins)*binWidth)
        self.frequencies = Array(repeating: 0, count: nBins)
    }

    ///
    /// Create the distribution with a specified number of class intervals.
    /// @param numberOfClasses the number of class intervals
    ///
    public init(copyFrom: Histogram) {
        self.frequencies = copyFrom.frequencies.map { $0 }
        self.minValue = copyFrom.minValue
        self.maxValue = copyFrom.maxValue
        self.nBins = copyFrom.nBins
        self.binWidth = copyFrom.binWidth
    }

    ///
    /// Creates a copy of this histogram and returns it. The returned
    /// Histogram is a completely different object.
    /// @return a copy of this histogram.
    public func copy() -> Histogram {
        return Histogram(copyFrom:self)
    }

    ///
    /// Get N, the total size of the histogram.
    /// @return the sum of all the frequencies in the class intervals.
    ///
    public func getN() -> Int {
        return self.frequencies.reduce(0, +)
    }

    ///
    /// Add a value to the histogram.
    /// @param value the value to be added to the histogram. This will increment the correct
    /// class interval in the histogram.
    public func add(value: Double) {
        guard value >= minValue && value < maxValue else {
            // TODO: log error/warning if the value doesn't fit in the histogram.
            return
        }

        var interval = 0
        if value == minValue {
            interval = 0
        } else if value == maxValue {
            interval = nBins-1
        } else {
            interval = Int(floor((value-minValue) / binWidth))
        }

        self.frequencies[interval] += 1

    }

    ///
    /// Add an array of values to the histogram.
    /// @param values the values to be added to the histogram. This will increment the correct
    /// class interval in the histogram with each of the values.
    public func add(array: [Double]) {
        for value in array {
            self.add (value: value)
        }
    }

    ///
    /// Add the contents of a histogram to this one. Note that the histogram to be
    /// added must have the same attributes as the one being added to.
    /// @param value the value to be added to the histogram
    public func add(values: Histogram) {
        guard values.minValue == self.minValue
                && values.maxValue == self.maxValue
                && values.nBins == self.nBins  else {
            // Can only add histograms with the same class interval, regardless of where the 
            // histogram starts or finishes
            return
        }

        for i in 0..<nBins {
                self.frequencies[i] += values.frequencies[i]

        }
    }
}
