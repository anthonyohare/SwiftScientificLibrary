//
//  ComplexMath.swift
//
// See LICENSE.txt for license information

import Foundation

/// Compute the square root  of a complex number
/// - SeeAlso https://en.wikipedia.org/wiki/Complex_number#Square_root
///
/// - Parameter value: The complex number argument to the sqrt() function.
/// - Returns: The [positive] square root of the given number.
public func sqrt(value: Complex) -> Complex {

    if value.imag.isZero {
        return Complex(real: sqrt(value.real), imag: 0.0)
    }

    let abs = value.abs()
    let realPart = sqrt((value.real + abs) / 2.0)
    let imagPart = sqrt((-value.real + abs) / 2.0)
    return Complex(real: realPart, imag: (value.imag.sign == .minus) ? -imagPart : imagPart)
}

/// Calculate the exp(z) function for complex numbers z defined as
/// $e^z = e^{\Re z + i\Im z} = e^{\Re z} (\cos\Im z + i \sin \Im z)$.
/// - SeeAlso http://www.theoretical-physics.net/dev/math/complex.html#exponential
///
/// - Parameters:
///   - value: the complex number
/// - Returns: The log of value.
public func exp(value: Complex) -> Complex {
    let abs = exp(value.real)
    return Complex(real: abs * cos(value.imag), imag: abs * sin(value.imag))
}

/// Calculate the log(z) function for complex numbers z defined as
/// $\log(z) = \log|z| + i \arg z$.
/// - SeeAlso http://www.theoretical-physics.net/dev/math/complex.html#logarithm
///
/// - Parameters:
///   - value: the complex number
/// - Returns: The log of value.
public func log(value: Complex) -> Complex {
    return Complex(real: log(value.abs()), imag: value.arg())
}

// //////////////////////  Trigonometic Functions ///////////////////////////////////////////////

/// Compute the sine of a complex number (sin(z))
///
/// - Parameter value: The complex number argument to the sin() function.
/// - Returns: The sine of the given number.
public func sin(value: Complex) -> Complex {
    let realPart = value.real
    let imagPart = value.imag

    if imagPart == 0.0 {
        return Complex(real: sin(realPart), imag: 0.0)
    } else {
        return Complex(real: sin(realPart) * cosh(imagPart), imag: cos(realPart) * sinh(imagPart))
    }
}

/// Compute the cosine of a complex number (cos(z)).
///
/// - Parameter value: The complex number argument to the cos() function.
/// - Returns: The cosine of the given number.
public func cos(value: Complex) -> Complex {
    let realPart = value.real
    let imagPart = value.imag

    if imagPart == 0.0 {
        return Complex(real: cos(realPart), imag: 0.0)
    } else {
        return Complex(real: cos(realPart) * cosh(imagPart), imag: sin(realPart) * sinh(-imagPart))
    }
}

/// Compute the tan of a complex number (tan(z)).
///
/// - Parameter value: The complex number argument to the tan() function.
/// - Returns: The tan of the given number.
public func tan(value: Complex) -> Complex {
    let realPart = value.real
    let imagPart = value.imag

    if imagPart < 1 {
        let d = pow(cos(realPart), 2.0) + pow(sinh(imagPart), 2.0)
        return Complex(real: ((0.5 * sin(2 * realPart)) / d), imag: ((0.5 * sinh(2 * imagPart)) / d))
    } else {
        let u = exp(-imagPart)
        let c = (2 * u) / (1 - pow(u, 2.0))
        let d = 1 + (pow(cos(realPart), 2.0) * pow(c, 2.0))

        let s = pow(c, 2.0)
        let t = 1.0 / tanh(imagPart)

        return Complex(real: ((0.5 * sin(2 * realPart) * s) / d), imag: t / d)
    }
}

/// Compute the cot of a complex number (cot(z) = cos(z)/sin(z)).
///
/// - Parameter value: The complex number argument to the cot() function.
/// - Returns: The cot of the given number.
public func cot(value zed: Complex) -> Complex {
    return cos(value: zed) / sin(value: zed)
}

/// Compute the cosecant function of a complex number (scs(z) = 1/sin(z)).
///
/// - Parameter value: The complex number argument to the csc() function.
/// - Returns: The csc of the given number.
public func csc(value zed: Complex) -> Complex {
    return Complex(real: 1.0, imag: 0.0) / sin(value: zed)
}

/// Compute the secant function of a complex number (sec(z) = 1/cos(z)).
///
/// - Parameter value: The complex number argument to the csc() function.
/// - Returns: The csc of the given number.
public func sec(value zed: Complex) -> Complex {
    return Complex(real: 1.0, imag: 0.0) / cos(value: zed)
}

// //////////////////////  Inverse Trigonometic Functions ///////////////////////////////////////

/// Compute the arc-sin (inverse sin) of a complex number (asin(z)). The formula
/// used is asin(z) = -i*log(iz + sqrt(1-z^2)).
/// - SeeAlso http://functions.wolfram.com/ElementaryFunctions/ArcSin/02/
///
/// - Parameter value: The complex number argument to the asin() function.
/// - Returns: The asin of the given number.
public func asin(value: Complex) -> Complex {
    let pureI = Complex(real: 0.0, imag: 1.0)
    return -1.0*pureI*log(value: (pureI*value + sqrt(value: 1-value.toPower(of: 2))))
}

/// Compute the arc-cos (inverse cos) of a complex number (acos(z)). The formula
/// used is acos(z) = pi/2 + i*log(iz + sqrt(1-z^2)).
/// - SeeAlso http://functions.wolfram.com/ElementaryFunctions/ArcCos/02/
///
/// - Parameter value: The complex number argument to the acos() function.
/// - Returns: The acos of the given number.
public func acos(value: Complex) -> Complex {
    let pureI = Complex(real: 0.0, imag: 1.0)
    let halfPi = Complex(real: Double.pi/2.0, imag: 0.0)
    return halfPi + pureI*log(value: (pureI*value + sqrt(value: 1-value.toPower(of: 2))))
}

/// Compute the arc-tan (inverse tan) of a complex number (atan(z)). The formula
/// used is atan(z) = (i/2)*(log(1-iz)-log(1+iz)) = -i*atanh(z)
/// - SeeAlso http://functions.wolfram.com/ElementaryFunctions/ArcTan/02/
///
/// - Parameter value: The complex number argument to the atan() function.
/// - Returns: The atan of the given number.
public func atan(value: Complex) -> Complex {
    let pureI = Complex(real: 0.0, imag: 1.0)
    return (pureI/2.0) * (log(value: (1-pureI*value)) - log(value: (1+pureI*value)))
}

// //////////////////////  HyperbolicTrigonometic Functions /////////////////////////////////////

/// Compute the sinh (hyperbolic sinh) of a complex number (sinh(z) = -isin(iz)).
/// -SeeAlso http://functions.wolfram.com/ElementaryFunctions/Sinh/introductions/Sinh/01/
///
/// - Parameter value: The complex number argument to the sinh() function.
/// - Returns: The sinh of the given number.
public func sinh(value: Complex) -> Complex {
    let pureI = Complex(real: 0.0, imag: 1.0)
    return -1.0*pureI*sin(value: (pureI*value))
}

/// Compute the cosh (hyperbolic cos) of a complex number (cosh(z) = cos(iz)).
/// - SeeAlso http://functions.wolfram.com/ElementaryFunctions/Cosh/introductions/Cosh/01/
///
/// - Parameter value: The complex number argument to the cosh() function.
/// - Returns: The cosh of the given number.
public func cosh(value: Complex) -> Complex {
    let pureI = Complex(real: 0.0, imag: 1.0)
    return cos(value: (pureI*value))
}

/// Compute the tanh (hyperbolic tan) of a complex number (tanh(z) = -itan(iz)).
/// - SeeAlso http://functions.wolfram.com/ElementaryFunctions/Tanh/introductions/Tanh/ShowAll.html
///
/// - Parameter value: The complex number argument to the tanh() function.
/// - Returns: The tanh of the given number.
public func tanh(value: Complex) -> Complex {
    let pureI = Complex(real: 0.0, imag: 1.0)
    return -1.0*pureI*tan(value: (pureI*value))
}

// //////////////////////  Inverse Hyperbolic Trigonometic Functions /////////////////////////////////////////

/// Compute the arc-sinh (inverse sinh) of a complex number (asinh(z)). The formula
/// used is asinh(z) = log(z + sqrt(z^2 + 1)) = i*asin(iz)
///
/// - Parameter value: The complex number argument to the asinh() function.
/// - Returns: The asinh of the given number.
public func asinh(value: Complex) -> Complex {
    // We use asinh(z) = i asin(-i z); as does the boost C++ library
    let pureI = Complex(real: 0.0, imag: 1.0)
    return pureI*asin(value: Complex(real: 0.0, imag: -1.0)*value)
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
    if !result.imag.isNaN && result.imag < 0.0 {
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
    let x = fabs(value.real)
    let y = fabs(value.imag)

    //
    // Begin by handling the special cases specified in C99:
    if x.isNaN {
        if y.isNaN {
            return Complex(real: x, imag: x)
        } else if y.isInfinite {
            let tmp = value.imag < 0.0 ? -Double.pi : Double.pi
            return Complex(real: 0, imag: tmp)
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
        if value.real < 0.0 {
            real *= -1.0
        }

        var imag = atan2((y * 2.0), ((1.0 - x) * (1.0 + x) - y * y))
        imag /= 2.0
        if value.imag < 0 {
            imag *= -1.0
        }

        return Complex(real: real, imag: imag)
    }
}
