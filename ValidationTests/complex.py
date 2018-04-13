
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
cNums, cSwift = generate_values(5)

print (cSwift)
print ('')
for i in range(0, len(cNums)):
    print ('XCTAssertEqual(exp(value: c[{}]).real, {}, accuracy:1E-6)'.format(i, exp(cNums[i]).real))
    print ('XCTAssertEqual(exp(value: c[{}]).imag, {}, accuracy:1E-6)'.format(i, exp(cNums[i]).imag))
print ('')

for i in range(0, len(cNums)):
    print ('XCTAssertEqual(log(value: c[{}]).real, {}, accuracy:1E-6)'.format(i, log(cNums[i]).real))
    print ('XCTAssertEqual(log(value: c[{}]).imag, {}, accuracy:1E-6)'.format(i, log(cNums[i]).imag))
print ('')

for i in range(0, len(cNums)):
    print ('XCTAssertEqual(sqrt(value: c[{}]).real, {}, accuracy:1E-6)'.format(i, sqrt(cNums[i]).real))
    print ('XCTAssertEqual(sqrt(value: c[{}]).imag, {}, accuracy:1E-6)'.format(i, sqrt(cNums[i]).imag))
print ('')


print ('')
print ('')
print ('')

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
