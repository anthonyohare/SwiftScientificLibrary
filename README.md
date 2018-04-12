## Synopsis


The Swift Scientific Library (SSL) is a numerical library for swift programmers. It is free software inspired by the Gnu Scientific Library (GSL).

The library aims to provide a wide range of mathematical routines including test suites for each routine.

## Motivation

Swift is a new language created by Apple. It can use C libraries but as a way of learning swift I hit upon the idea of 
creating a dependency free object-oriented scientific library, inspired by the GNU Scientific Library (https://www.gnu.org/software/gsl/)

## Installation

##### Swift Package Manager
SSL uses the Swift Package Manager to compile the library. Simply clone the swift git repo and run 
```bash
swift build 
```

However, the preferred method of building is to use the Makefile, which builds, tests and checks the source code and puts all the generated files in the 'build' directory. The 'Example' directory contains an example application using the library (you may need to 'make install' to generate the Framework directory for the example). 

## API Reference

Depending on the size of the project, if it is small and simple enough the reference docs can be added to the README. For medium size to larger projects it is important to at least provide a link to where the API reference docs live.

## Tests

The test suites can be run via
```bash
swift test
```
## Contributors


SwiftScientificLibrary is very young, any feedback is appreciated and welcomed.
Please contribute if you feel like you can.

## License

SSL is distributed under the terms of the MIT License (MIT).
