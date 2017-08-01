# Simple Makefile that simply calls the swift package manager to build the library.
# I can never remember all the command line options/flags to the SPM, 
TARGET=test

all:
	swift build -c debug  -Xlinker -L/usr/local/opt/openblas/lib 
	swift build -c release -Xlinker -L/usr/local/opt/openblas/lib

test:
	@rm -rf swift-reports
	@mkdir swift-reports
	@set -x
	swift test -Xlinker -L/usr/local/opt/openblas/lib -Xlinker -lopenblas 2>&1 | tee swift_build.log 
	@cat swift_build.log  | xcpretty -t --color --report junit
	@cat swift_build.log  | xcpretty -t --color --report html
	@cat swift_build.log  | xcpretty -s --color
	@mv build/reports/junit.xml swift-reports/TEST-report-summary.xml
	@mv build/reports/tests.html swift-reports/TEST-report.html
	@rm -rf build/
	@#@slather coverage --input-format profdata --cobertura-xml --output-directory swift-reports
	@#@mv swift-reports/cobertura.xml swift-reports/coverage.xml
	@lizard --xml Sources > swift-reports/lizard-report.xml
	@swiftlint lint --path Sources > swift-reports/Swiftlint.txt

install:
	cp .build/debug/$(TARGET) .

clean :
	rm -f *~
	rm -rf Packages
	rm -rf swift-reports/
	rm -rf swift_build.log
	swift package clean
	rm -rf .build

tidy:
	rm *~ 
