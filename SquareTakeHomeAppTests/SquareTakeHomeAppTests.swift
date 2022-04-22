//
//  SquareTakeHomeAppTests.swift
//  SquareTakeHomeAppTests
//
//  Created by clydies freeman on 4/21/22.
//

import Combine
@testable import SquareTakeHomeApp
import SwiftUI
import XCTest

class SquareTakeHomeAppTests: XCTestCase {
    var employeeProvider: EmployeeProvider!

    override func setUp() {
        employeeProvider = EmployeeProvider()
    }

    func testGetEmployeesCorrectCount() throws {
       employeeProvider.getEmployeeList()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            XCTAssertEqual(self.employeeProvider.employees?.count, 11)
        }
    }
    
    func testGetEmptyEmployeesCorrectCount() throws {
       employeeProvider.getEmptyEmployeeList()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            XCTAssertEqual(self.employeeProvider.employees?.count, 0)
        }
    }
    
    func testGetMalformedEmployeesCorrectCount() throws {
       employeeProvider.getMalformedEmployeeList()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            XCTAssertNil(self.employeeProvider.employees)
        }
    }
}
