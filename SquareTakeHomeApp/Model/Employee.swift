//
//  Employee.swift
//  SquareTakeHomeApp
//
//  Created by clydies freeman on 4/20/22.
//

import Foundation
import SwiftUI

enum Employee_Type: String, Decodable {
    case FULL_TIME
    case PART_TIME
    case CONTRACTOR
}

extension Employee_Type {
    var EmployeeTypeColor: Color {
        switch self {
        case .FULL_TIME:
            return .blue
        case .PART_TIME:
            return .red
        case .CONTRACTOR:
            return .purple
        }
    }
    
    var EmployeeTypeIcon: String {
        switch self {
        case .FULL_TIME:
            return "clock.arrow.circlepath"
        case .PART_TIME:
            return "clock.badge.exclamationmark"
        case .CONTRACTOR:
            return "calendar.badge.clock"
        }
    }
}

struct Employees: Decodable {
    let employees: [Employee]
}

struct Employee: Decodable {
    let uuid: String
    let full_name: String
    let phone_number: String?
    let email_address: String
    let biography: String?
    let photo_url_small: String?
    let photo_url_large: String?
    let team: String
    let employee_type: Employee_Type
}

extension Employee {
    static var testEmployee = Employee(uuid: "34734R",
                                       full_name: "Tester Dumbville",
                                       phone_number: "5089991234",
                                       email_address: "tester@gmail.com",
                                       biography: "he was a good boy and he really liked going on walks till he got ate by a shark",
                                       photo_url_small: nil,
                                       photo_url_large: nil,
                                       team: "Engineering", employee_type: .CONTRACTOR)
}
