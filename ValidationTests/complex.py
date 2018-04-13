
# Generate test cases for complex maths -  the output should copy'n'pasteable to ComplexTests

def toSwift(z):
    return "Complex(real:" + str(z.real) + ", imag:" + str(z.imag) + ")"

def generate_values(n):
    from random import uniform
    
    c = []
    c_swift = "let c = ["
    for i in range(1,n):
        re = round(uniform(-5.0, 10.0), 3)
        im = round(uniform(-8.0, 8.0), 3)
        c.append(re + 1j*im)
        if i > 1:
            c_swift += ", "
        c_swift += "Complex(real:" + str(re) + ", imag:" + str(im) + ")"

    c_swift += "]"

    return c,c_swift





from cmath import sqrt, exp, log
from cmath import cos, sin, tan
from cmath import acos, asin, atan
from cmath import cosh, sinh, tanh
from cmath import acosh, asinh, atanh

cNums, cSwift = generate_values(5)

print ("testComplexExponentialFunctions \n\n")
print (cSwift)
print ('')
for i in range(0, len(cNums)):
    print ('XCTAssertTrue( exp(value: c[{}]) == {})'.format(i, toSwift(exp(cNums[i]))))
print ('')

for i in range(0, len(cNums)):
    print ('XCTAssertTrue( log(value: c[{}]) == {})'.format(i, toSwift(log(cNums[i]))))
print ('')

for i in range(0, len(cNums)):
    print ('XCTAssertTrue( sqrt(value: c[{}]) == {})'.format(i, toSwift(sqrt(cNums[i]))))
print ('')

print ("testComplexTrigonometricFunctions \n\n")
print (cSwift)
print ('')
for i in range(0, len(cNums)):
    print ('XCTAssertTrue( cos(value: c[{}]) == {})'.format(i, toSwift(cos(cNums[i]))))
print ('')

for i in range(0, len(cNums)):
    print ('XCTAssertTrue( sin(value: c[{}]) == {})'.format(i, toSwift(sin(cNums[i]))))
print ('')

for i in range(0, len(cNums)):
    print ('XCTAssertTrue( tan(value: c[{}]) == {})'.format(i, toSwift(tan(cNums[i]))))
print ('')

for i in range(0, len(cNums)):
    print ('XCTAssertTrue( sec(value: c[{}]) == {})'.format(i, toSwift(1.0/cos(cNums[i]))))
print ('')

for i in range(0, len(cNums)):
    print ('XCTAssertTrue( csc(value: c[{}]) == {})'.format(i, toSwift(1.0/sin(cNums[i]))))
print ('')

for i in range(0, len(cNums)):
    print ('XCTAssertTrue( cot(value: c[{}]) == {})'.format(i, toSwift(cos(cNums[i])/sin(cNums[i]))))
print ('')


print ("testComplexArcTrigonometricFunctions \n\n")
print (cSwift)
print ('')
for i in range(0, len(cNums)):
    print ('XCTAssertTrue( acos(value: c[{}]) == {})'.format(i, toSwift(acos(cNums[i]))))
print ('')

for i in range(0, len(cNums)):
    print ('XCTAssertTrue( asin(value: c[{}]) == {})'.format(i, toSwift(asin(cNums[i]))))
print ('')

for i in range(0, len(cNums)):
    print ('XCTAssertTrue( atan(value: c[{}]) == {})'.format(i, toSwift(atan(cNums[i]))))
print ('')



print ("testComplexHyperbolicFunctions \n\n")
print (cSwift)
print ('')
for i in range(0, len(cNums)):
    print ('XCTAssertTrue( cosh(value: c[{}]) == {})'.format(i, toSwift(cosh(cNums[i]))))
print ('')

for i in range(0, len(cNums)):
    print ('XCTAssertTrue( sinh(value: c[{}]) == {})'.format(i, toSwift(sinh(cNums[i]))))
print ('')

for i in range(0, len(cNums)):
    print ('XCTAssertTrue( tanh(value: c[{}]) == {})'.format(i, toSwift(tanh(cNums[i]))))
print ('')




print ("testComplexArcHyperbolicFunctions \n\n")
print (cSwift)
print ('')
for i in range(0, len(cNums)):
    print ('XCTAssertTrue( acosh(value: c[{}]) == {})'.format(i, toSwift(acosh(cNums[i]))))
print ('')

for i in range(0, len(cNums)):
    print ('XCTAssertTrue( asinh(value: c[{}]) == {})'.format(i, toSwift(asinh(cNums[i]))))
print ('')

for i in range(0, len(cNums)):
    print ('XCTAssertTrue( atanh(value: c[{}]) == {})'.format(i, toSwift(atanh(cNums[i]))))
print ('')






print ('')
print ('')
print ('')

print ("testComplexPowerFunctions \n\n")
powers, powersSwift = generate_values(3)
powers.append(0.0)
powers.append(0.5)
powers.append(1j)
# convert powers to swift types (as string)
powersSwift = []
for i in range(0, len(powers)):
    powersSwift.append(toSwift(powers[i]))

print (cSwift)
print ('')
for i in range(0, len(cNums)):
    for j in range(0, len(powers)):
        print ('XCTAssertTrue( c[{}].toPower(of: {}) == {})'.format(i, powersSwift[j], toSwift(cNums[i]**powers[j])))
print ('')
