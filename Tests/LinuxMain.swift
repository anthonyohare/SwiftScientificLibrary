import XCTest

import baseTests
import randTests 
import statTests


XCTMain([
	testCase(baseTests.allTests),
	testCase(randTests.allTests),
	testCase(statTests.allTests)
])


