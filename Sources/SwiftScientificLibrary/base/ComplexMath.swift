//
//  ComplexMath.swift
//
// See LICENSE.txt for license information

import Foundation

/// Compute the sine of a complex number (sin(z))
///
/// - Parameter value: The complex number argument to the sin() function.
/// - Returns: The sine of the given number.
public func sin(value: Complex) -> Complex {
    let r = value.real()
    let i = value.imag()

    if i == 0.0 {
        return Complex(real: sin(r), imag: 0.0)
    } else {
        return Complex(real: sin(r) * cosh(i), imag: cos(r) * sinh(i))
    }
}

/// Compute the cosine of a complex number (cos(z)).
///
/// - Parameter value: The complex number argument to the cos() function.
/// - Returns: The cosine of the given number.
public func cos(value: Complex) -> Complex {
    let r = value.real()
    let i = value.imag()

    if i == 0.0 {
        return Complex(real: cos(r), imag: 0.0)
    } else {
        return Complex(real: cos(r) * cosh(i), imag: sin(r) * sinh(-i))
    }
}

/// Compute the tan of a complex number (tan(z)).
///
/// - Parameter value: The complex number argument to the tan() function.
/// - Returns: The tan of the given number.
public func tan(value: Complex) -> Complex {
    let r = value.real()
    let i = value.imag()

    if i < 1 {
        let d = pow(cos(r), 2.0) + pow(sinh(i), 2.0)

        return Complex(real: ((0.5 * sin(2 * r)) / d), imag: ((0.5 * sinh(2 * i)) / d))
    } else {
        let u = exp(-i)
        let c = (2 * u) / (1 - pow(u, 2.0))
        let d = 1 + (pow(cos(r), 2.0) * pow(c, 2.0))

        let s = pow(c, 2.0)
        let t = 1.0 / tanh(i)

        return Complex(real: ((0.5 * sin(2 * r) * s) / d), imag: t / d)
    }
}

/// Compute the arc-sin (inverse sin) of a complex number (asin(z)). The formula
/// used is asin(z) = -i*log(iz + sqrt(1-z^2)).
///
/// - Parameter value: The complex number argument to the asin() function.
/// - Returns: The asin of the given number.
public func asin(value: Complex) -> Complex {
    // This implementation is an implementation of
    // "Implementing the Complex Arcsine and Arccosine Functions using Exception Handling."
    // T E Hull, Thomas F Fairgrieve and Ping Tak Peter Tang.
    // ACM Transactions on Mathematical Software, Vol 23, No 3, Sept 1997.

    let x = fabs(value.real())
    let y = fabs(value.imag())

    let answer = Complex()

    if y == 0.0 {
        answer.components[0] = acos(x)
    } else {
        // these values could be adjusted to give slightly better error bounds, depending on the
        // system being used, but I've not tested these.
        let Acrossover = 1.5
        let Bcrossover = 0.6417

        let r = sqrt((x + 1) * (x + 1) + y * y)
        let s = sqrt((x - 1) * (x + 1) + y * y)
        let a = (r + s) * 0.5
        let b = x / a

        if b <= Bcrossover {
            answer.components[0] = asin(b)
        } else {
            if x <= 1.0 {
                let d = 0.5 * (a + x) * (y * y / (r + x + 1) + (s + (1 - x)))
                answer.components[0] = atan(x / sqrt(d))
            } else {
                let Apx = a + x
                let d = 0.5 * (Apx / (r + x + 1) + Apx / (s + (x - 1)))
                answer.components[0] = atan(x / (y * sqrt(d)))
            }
        }

        if a <= Acrossover {
            var am1 = 0.0
            if x < 1 {
                am1 = 0.5 * (y * y / (r + x + 1) + y * y / (s + (1 - x)))
            } else {
                am1 = 0.5 * (y * y / (r + x + 1) + (s + (x - 1)))
            }

            answer.components[1] = log1p(am1 + sqrt(am1 * (a + 1)))
        } else {
            answer.components[1] = log(a + sqrt(a * a - 1))
        }
        // The boost (C++) library includes the Hull et al exception handling code from Fig 6 of
        // their paper, whereas the GNU scientific library does not. We also do not include it.

        if value.real() < 0.0 {
            answer.components[0] = answer.real()
        }
        if value.imag() < 0.0 {
            answer.components[1] *= -1.0
        }
    }
    return answer
}

/// Compute the arc-cos (inverse cos) of a complex number (acos(z)). The formula
/// used is acos(z) = pi/2 + i*log(iz + sqrt(1-z^2)).
///
/// - Parameter value: The complex number argument to the acos() function.
/// - Returns: The acos of the given number.
public func acos(value: Complex) -> Complex {

    // This implementation is an implementation of
    // "Implementing the Complex Arcsine and Arccosine Functions using Exception Handling."
    // T E Hull, Thomas F Fairgrieve and Ping Tak Peter Tang.
    // ACM Transactions on Mathematical Software, Vol 23, No 3, Sept 1997.

    let x = fabs(value.real())
    let y = fabs(value.imag())

    let answer = Complex()

    if y == 0.0 {
        answer.components[0] = acos(x)
    } else {
        // these values could be adjusted to give slightly better error bounds, depending on the
        // system being used, but I've not tested these.
        let Acrossover = 1.5
        let Bcrossover = 0.6417

        let r = sqrt((x + 1) * (x + 1) + y * y)
        let s = sqrt((x - 1) * (x + 1) + y * y)
        let a = (r + s) * 0.5
        let b = x / a

        if b <= Bcrossover {
            answer.components[0] = acos(b)
        } else {
            if x <= 1.0 {
                answer.components[0] = atan(sqrt(0.5 * (a + x) * (y * y / (r + x + 1) + (s + (1 - x)))) / x)
            } else {
                answer.components[0] = atan(y * sqrt(0.5 * ((a + x) / (r + x + 1) + (a + x) / (s + (x - 1)))) / x)
            }
        }

        if a <= Acrossover {
            var am1 = 0.0
            if x < 1.0 {
                am1 = ((y * y) / (r + (x + 1)) + (y * y) / (s + (1 - x))) * 0.5
            } else {
                am1 = ((y * y) / (r + (x + 1)) + (s + (x - 1))) * 0.5
            }
            answer.components[1] = log1p(am1 + sqrt(am1 * (a + 1)))
        } else {
            answer.components[1] = log(a + sqrt(a * a - 1))
        }
        // The boost (C++) library includes the Hull et al exception handling code from Fig 6 of
        // their paper, whereas the GNU scientific library does not. We also do not include it.

        if value.real() < 0.0 {
            answer.components[0] = Double.pi - answer.real()
        }
        if value.imag() >= 0.0 {
            answer.components[1] *= -1.0
        }
    }

    return answer
}

/// Compute the arc-tan (inverse tan) of a complex number (atan(z)). The formula
/// used is atan(z) = (i/2)*(log(1-iz)-log(1+iz)) = -i*atanh(z)
///
/// - Parameter value: The complex number argument to the atan() function.
/// - Returns: The atan of the given number.
public func atan(value: Complex) -> Complex {

    if value.imag() == 0.0 {
        return Complex(real: atan(value.real()), imag: 0)
    } else {
        // This is a naive implementation which does not fully take into account cancellation errors, overflow,
        // underflow etc. it is translated from the GSL library.

        var result = Complex()

        func hypot(_ xxx: Double, _ yyy: Double) -> Double {
            return sqrt(xxx * xxx + yyy * yyy)
        }

        let r = hypot(value.real(), value.imag())
        let u = 2 * value.imag() / (1 + value.real() * value.real())

        var imag: Double

        if fabs(u) < 0.1 {
            imag = 0.25 * (log1p(u) - log1p(-u))
        } else {
            let a = hypot(value.real(), value.imag() + 1)
            let b = hypot(value.real(), value.imag() - 1)
            imag = 0.5 * log(a / b)
        }

        if value.real() == 0 {
            if value.imag() > 1 {
                return Complex(real: Double.pi / 2.0, imag: imag)
            } else if value.imag() < -1 {
                return Complex(real: -Double.pi / 2.0, imag: imag)
            } else {
                return Complex(real: 0, imag: imag)
            }
        } else {
            return Complex(real: 0.5 * atan2(2 * value.real(), ((1 + r) * (1 - r))), imag: imag)
        }
    }
}

/*
/// Compute the sinh (hyperbolic sinh) of a complex number (sinh(z)).
///
/// - Parameter value: The complex number argument to the sinh() function.
/// - Returns: The sinh of the given number.
public func sinh(value: Complex) -> Complex {
    // TODO: see implementation in boost
}

/// Compute the cosh (hyperbolic cos) of a complex number (cosh(z)).
///
/// - Parameter value: The complex number argument to the cosh() function.
/// - Returns: The cosh of the given number.
public func cosh(value: Complex) -> Complex {
    // TODO: see implementation in boost
}

/// Compute the tanh (hyperbolic tan) of a complex number (atanh(z)).
///
/// - Parameter value: The complex number argument to the tanh() function.
/// - Returns: The tanh of the given number.
public func tanh(value: Complex) -> Complex {
    // TODO: see implementation in boost
}
*/

/// Compute the arc-sinh (inverse sinh) of a complex number (asinh(z)). The formula
/// used is asinh(z) = log(z + sqrt(z^2 + 1)) = i*asin(iz)
///
/// - Parameter value: The complex number argument to the asinh() function.
/// - Returns: The asinh of the given number.
public func asinh(value: Complex) -> Complex {
    // We use asinh(z) = i asin(-i z); as does the boost C++ library
    let i = Complex(real: 0.0, imag: 1.0)
    return i*asin(value: Complex(real: 0.0, imag: -1.0)*value)
}

/// Compute the arc-cosh (inverse cosh) of a complex number (acosh(z)). The formula
/// used is acosh(z) = log(z + sqrt(z-1)*sqrt(z+1)) = \pm acos(z)
///
/// - Parameter value: The complex number argument to the acosh() function.
/// - Returns: The acosh of the given number.
public func acosh(value: Complex) -> Complex {
    // This implementation is a conversion from the boost.math.acos(const std::complex<T>& z)
    // function using the relation acosh(z) = +-i acos(z)

    let result = acos(value: value)
    if !result.imag().isNaN && result.imag() < 0.0 {
        return result * Complex(real: 0.0, imag: 1.0)
    }
    return result * Complex(real: 0.0, imag: -1.0)
}

/// Compute the arc-tanh (inverse tanh) of a complex number (atanh(z)). The formula
/// used is atanh(z) = 0.5*(log(1+z) - log(1-z)))
///
/// - Parameter value: The complex number argument to the atanh() function.
/// - Returns: The atanh of the given number.
public func atanh(value: Complex) -> Complex {
    let x = fabs(value.real())
    let y = fabs(value.imag())

    //
    // Begin by handling the special cases specified in C99:
    if x.isNaN {
        if y.isNaN {
            return Complex(real: x, imag: x)
        } else if y.isInfinite {
            let im = value.imag() < 0.0 ? -Double.pi : Double.pi
            return Complex(real: 0, imag: im)
        } else {
            return Complex(real: x, imag: x)
        }
    } else if y.isNaN {
        if x == 0 {
            return Complex(real: x, imag: y)
        }
        if x.isInfinite {
            return Complex(real: 0, imag: y)
        } else {
            return Complex(real: y, imag: y)
        }
    } else {

        // the boost C++ library handles potential overflow errors, we ignore these here.
        // The real part is given by:
        // real(atanh(z)) == log1p(4*x / ((x-1)*(x-1) + y^2)) <- I think this should say (1-x)*(1-x)

        var real = log1p(4.0 * x / ((1.0 - x) * (1.0 - x) + y * y))
        real /= 4.0
        if value.real() < 0.0 {
            real *= -1.0
        }

        var imag = atan2((y * 2.0), ((1.0 - x) * (1.0 + x) - y * y))
        imag /= 2.0
        if value.imag() < 0 {
            imag *= -1.0
        }

        return Complex(real: real, imag: imag)
    }
}
