#include <sstream>
#include <iostream>
#include <string>
#include <gsl/gsl_math.h>
#include <gsl/gsl_vector.h>
#include <gsl/gsl_blas.h>
#include <gsl/gsl_rng.h>
#include <iomanip>
#include <complex>
#include <cmath>
#include <random>


using namespace std::complex_literals;



// pretty print a gsl vector. 
std::string ppVector(const gsl_vector *v) {
    std::ostringstream str;
    int r;

    str << "(";
    for (r = 0; r < (int) v->size; r++) {
        str << gsl_vector_get(v, r);
        if (r < v->size - 1) {
            str << ",";
        }
    }
    str << ")";
    return str.str();
}


void
vectorOpsCheck() {
    fprintf(stdout, "\n Vector Operations ..............................................\n");
    int N = 3;

    gsl_vector *v1 = gsl_vector_alloc(N);
    gsl_vector *v2 = gsl_vector_alloc(N);
    gsl_vector *v3 = gsl_vector_alloc(N);
    gsl_vector *v4 = gsl_vector_alloc(N);
    gsl_vector *v5 = gsl_vector_alloc(N);

    gsl_vector_set_all(v1, 1.0);
    gsl_vector_set_zero(v2);

    gsl_vector_set(v2, 1, 1.0);

    gsl_vector_set(v3, 0, 0.1);
    gsl_vector_set(v3, 1, 0.6);
    gsl_vector_set(v3, 2, 0.3);

    gsl_vector_set(v4, 0, 1.3);
    gsl_vector_set(v4, 1, 0.0);
    gsl_vector_set(v4, 2, 0.9);

    gsl_vector_set(v5, 0, 0.8);
    gsl_vector_set(v5, 1, 1.2);
    gsl_vector_set(v5, 2, 1.6);

    fprintf(stdout, "v1 = %s\n", ppVector(v1).c_str());
    fprintf(stdout, "v2 = %s\n", ppVector(v2).c_str());
    gsl_vector_add(v1, v2);
    fprintf(stdout, "v1 + v2 = %s\n", ppVector(v1).c_str());
    fprintf(stdout, "\n");

    fprintf(stdout, "v1 = %s\n", ppVector(v3).c_str());
    fprintf(stdout, "v2 = %s\n", ppVector(v5).c_str());
    gsl_vector_sub(v3, v5);
    fprintf(stdout, "v1 - v2 = %s\n", ppVector(v3).c_str());
    fprintf(stdout, "\n");

    fprintf(stdout, "v1 = %s\n", ppVector(v2).c_str());
    fprintf(stdout, "v2 = %s\n", ppVector(v4).c_str());
    gsl_vector_mul(v2, v4);
    fprintf(stdout, "v1 dot v2 = %s\n", ppVector(v2).c_str());
    fprintf(stdout, "\n");

    fprintf(stdout, "v1 = %s\n",  ppVector(v5).c_str());
    fprintf(stdout, "norm(v1) = %f\n", gsl_blas_dnrm2(v5));
    fprintf(stdout, "\n");

    gsl_vector_free(v1);
    gsl_vector_free(v2);
    gsl_vector_free(v3);
    gsl_vector_free(v4);
    gsl_vector_free(v5);

    fprintf(stdout, "\n");
}


void
complexNumOpsCheck() {
    fprintf(stdout, "\n Complex Number Operations ..............................................\n");

    std::complex<double> c1 = 1.1 + 2.0i;
    std::complex<double> c2 = 2.3 - 0.4i;
    fprintf(stdout, "let c1 = Complex(real: %1.1f, imag: %1.1f)\n", real(c1), imag(c1));
    fprintf(stdout, "let c2 = Complex(real: %1.1f, imag: %1.1f)\n", real(c2), imag(c2));
    fprintf(stdout, "XCTAssertEqual(c1+c2, c2+c1)\n");
    fprintf(stdout, "XCTAssertEqual(c2*c1, c2*c1)\n");
    
    fprintf(stdout, "XCTAssertEqual(c1+c2, Complex(real:%1.1f, imag: %1.1f))\n", real(c1+c2), imag(c1+c2));
    fprintf(stdout, "XCTAssertEqual(c1-c2, Complex(real:%1.1f, imag: %1.1f))\n", real(c1-c2), imag(c1-c2));
    fprintf(stdout, "XCTAssertEqual(c1*c2, Complex(real:%1.1f, imag: %1.1f))\n", real(c1*c2), imag(c1*c2));
    fprintf(stdout, "XCTAssertEqual(c1/c2, Complex(real:%1.6f, imag: %1.6f))\n", real(c1/c2), imag(c1/c2));
    fprintf(stdout, "XCTAssertEqual(c2/c1, Complex(real:%1.6f, imag: %1.5f))\n", real(c2/c1), imag(c2/c1));

    fprintf(stdout, "XCTAssertEqual(c1.conjugate(), Complex(real:%1.1f, imag: %1.1f))\n", real(conj(c1)), imag(conj(c1)));
    fprintf(stdout, "XCTAssertEqual(c1.modulus(), %1.14f\n", norm(c1));
    fprintf(stdout, "XCTAssertEqual(c1.norm(), %1.14f\n", norm(c1));
    fprintf(stdout, "XCTAssertEqualWithAccuracy(c1.arg(), %1.15f, accuracy:0.0001)\n", arg(c1));
    
    fprintf(stdout, "XCTAssertEqual(c2.conjugate(), Complex(real:%1.1f, imag: %1.1f))\n", real(conj(c2)), imag(conj(c2)));
    fprintf(stdout, "XCTAssertEqual(c2.modulus(), %1.14f\n", norm(c2));
    fprintf(stdout, "XCTAssertEqual(c2.norm(), %1.14f\n", norm(c2));
    fprintf(stdout, "XCTAssertEqualWithAccuracy(c2.arg(), %1.15f, accuracy:0.0001)\n", arg(c2));

    fprintf(stdout, "\n");
}

void 
printComplexMathChecks(std::complex<double> c1) {

     fprintf(stdout, "var c1 = Complex(real: %1.1f, imag: %1.1f)\n", real(c1), imag(c1));
    fprintf(stdout, "let cosc1 = cos(value: c1)\n");
    fprintf(stdout, "let sinc1 = sin(value: c1)\n");
    fprintf(stdout, "let tanc1 = tan(value: c1)\n");
    fprintf(stdout, "XCTAssertEqual(cosc1.real(), %1.15f)\n", real(cos(c1)));
    fprintf(stdout, "XCTAssertEqual(cosc1.imag(), %1.15f)\n", imag(cos(c1)));
    fprintf(stdout, "XCTAssertEqual(sinc1.real(), %1.15f)\n", real(sin(c1)));
    fprintf(stdout, "XCTAssertEqual(sinc1.imag(), %1.15f)\n", imag(sin(c1)));
    fprintf(stdout, "XCTAssertEqual(tanc1.real(), %1.15f)\n", real(tan(c1)));
    fprintf(stdout, "XCTAssertEqual(tanc1.imag(), %1.15f)\n", imag(tan(c1)));

    fprintf(stdout, "let coshc1 = cosh(value: c1)\n");
    fprintf(stdout, "let sinhc1 = sinh(value: c1)\n");
    fprintf(stdout, "let tanhc1 = tanh(value: c1)\n");
    fprintf(stdout, "XCTAssertEqual(coshc1.real(), %1.15f)\n", real(cosh(c1)));
    fprintf(stdout, "XCTAssertEqual(coshc1.imag(), %1.15f)\n", imag(cosh(c1)));
    fprintf(stdout, "XCTAssertEqual(sinhc1.real(), %1.15f)\n", real(sinh(c1)));
    fprintf(stdout, "XCTAssertEqual(sinhc1.imag(), %1.15f)\n", imag(sinh(c1)));
    fprintf(stdout, "XCTAssertEqual(tanhc1.real(), %1.15f)\n", real(tanh(c1)));
    fprintf(stdout, "XCTAssertEqual(tanhc1.imag(), %1.15f)\n", imag(tanh(c1)));

    fprintf(stdout, "let acosc1 = acos(value: c1)\n");
    fprintf(stdout, "let asinc1 = asin(value: c1)\n");
    fprintf(stdout, "let atanc1 = atan(value: c1)\n");
    fprintf(stdout, "XCTAssertEqual(acosc1.real(), %1.15f)\n", real(acos(c1)));
    fprintf(stdout, "XCTAssertEqual(acosc1.imag(), %1.15f)\n", imag(acos(c1)));
    fprintf(stdout, "XCTAssertEqual(asinc1.real(), %1.15f)\n", real(asin(c1)));
    fprintf(stdout, "XCTAssertEqual(asinc1.imag(), %1.15f)\n", imag(asin(c1)));
    fprintf(stdout, "XCTAssertEqual(atanc1.real(), %1.15f)\n", real(atan(c1)));
    fprintf(stdout, "XCTAssertEqual(atanc1.imag(), %1.15f)\n", imag(atan(c1)));

    fprintf(stdout, "let acoshc1 = acosh(value: c1)\n");
    fprintf(stdout, "let asinhc1 = asinh(value: c1)\n");
    fprintf(stdout, "let atanhc1 = atanh(value: c1)\n");
    fprintf(stdout, "XCTAssertEqual(acoshc1.real(), %1.15f)\n", real(acosh(c1)));
    fprintf(stdout, "XCTAssertEqual(acoshc1.imag(), %1.15f)\n", imag(acosh(c1)));
    fprintf(stdout, "XCTAssertEqual(asinhc1.real(), %1.15f)\n", real(asinh(c1)));
    fprintf(stdout, "XCTAssertEqual(asinhc1.imag(), %1.15f)\n", imag(asinh(c1)));
    fprintf(stdout, "XCTAssertEqual(atanhc1.real(), %1.15f)\n", real(atanh(c1)));
    fprintf(stdout, "XCTAssertEqual(atanhc1.imag(), %1.15f)\n", imag(atanh(c1)));

    fprintf(stdout, "let expc1 = exp(value: c1)\n");
    fprintf(stdout, "let logc1 = log(value: c1)\n");
    fprintf(stdout, "let log10c1 = log10(value: c1)\n");
    fprintf(stdout, "let sqrtc1 = sqrt(value: c1)\n");
    fprintf(stdout, "XCTAssertEqual(expc1.real(), %1.15f)\n", real(exp(c1)));
    fprintf(stdout, "XCTAssertEqual(expc1.imag(), %1.15f)\n", imag(exp(c1)));
    fprintf(stdout, "XCTAssertEqual(logc1.real(), %1.15f)\n", real(log(c1)));
    fprintf(stdout, "XCTAssertEqual(logc1.imag(), %1.15f)\n", imag(log(c1)));
    fprintf(stdout, "XCTAssertEqual(log10c1.real(), %1.15f)\n", real(log10(c1)));
    fprintf(stdout, "XCTAssertEqual(log10c1.imag(), %1.15f)\n", imag(log10(c1)));
    fprintf(stdout, "XCTAssertEqual(sqrtc1.real(), %1.15f)\n", real(sqrt(c1)));
    fprintf(stdout, "XCTAssertEqual(sqrtc1.imag(), %1.15f)\n", imag(sqrt(c1)));
}

void
complexMathCheck() {
 
    fprintf(stdout, "\n Complex Number Trig Operations ..............................................\n");

    std::complex<double> c1 = 1.1 + 2.0i;
    printComplexMathChecks(c1);

    c1 = 2.3 - 0.4i;
    printComplexMathChecks(c1);

    fprintf(stdout, "\n");
}

void
rngCheck() {

    fprintf(stdout, "\n Random Number Generator Tests ..............................................\n");
    fprintf(stdout, "\n     Mersenne Twister 64 bit ..............................................\n");

    int n = 10;

    std::mt19937_64 generator (12345678);
    std::uniform_real_distribution<double> dis(0.0, 1.0);
    fprintf(stdout, "[%f",  dis(generator));
    for (int i = 1; i < n; i++) {
        fprintf(stdout, ", %f",  dis(generator));
    }
    fprintf(stdout, "]");

    fprintf(stdout, "\n");
}

int
main(void) {
    complexNumOpsCheck();
    vectorOpsCheck();
    rngCheck();
    complexMathCheck();

    return 0;
}
