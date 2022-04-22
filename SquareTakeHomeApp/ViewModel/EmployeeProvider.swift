//
//  MockAPI.swift
//  SquareTakeHomeApp
//
//  Created by clydies freeman on 4/21/22.
//

import Foundation
import Combine
@testable import Squar

class EmployeeProvider: EmployeeService {
    var apiSession: APIService
    
    var employees: [Employee]? = []
    
    init(){
        self.apiSession = APISession()
    }
    func getEmployeeList() -> AnyPublisher<Employees, APIError> {
            getEmployeeList()
    }
    
}
