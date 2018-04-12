import Foundation


/// An error class defining the errors in SSL.
///
/// - doubleCastError: a number cannot be cast as a double.
/// - integerCastError: a number cannot be cast as an integer.
enum Error: String, Swift.Error {
    case doubleCastError = "Cannot cast Complex to Double: loss of data"
    case integerCastError = "Cannot cast Complex to Integer: loss of data"
    case vectorCastError = "Cannot coerce vector types"
}

