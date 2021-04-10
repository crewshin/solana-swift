import XCTest

import SolanaTests

var tests = [XCTestCaseEntry]()
tests += SolanaTests.allTests()
XCTMain(tests)
