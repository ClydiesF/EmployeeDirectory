//
//  MockAPI.swift
//  SquareTakeHomeApp
//
//  Created by clydies freeman on 4/21/22.
//

import Foundation
import Combine

class EmployeeProvider: EmployeeService {
    var apiSession: APIService
    
    var employees: [Employee]? = []
    
    init(){
        self.apiSession = APISession()
    }
    
    func getEmployeeList() {
       _ = getEmployeeList()
            .sink { result in
                switch result {
                case let .failure(err):
                    print("DEBUG: error \(err)")
                case .finished:
                    break
                }
            } receiveValue: { employeeResponse in
                self.employees = employeeResponse.employees
            }
    }
    
    func getEmptyEmployeeList() {
       _ = getEmptyEmployeeList()
            .sink { result in
                switch result {
                case let .failure(err):
                    print("DEBUG: error \(err)")
                case .finished:
                    break
                }
            } receiveValue: { employeeResponse in
                self.employees = employeeResponse.employees
            }
    }
    
    func getMalformedEmployeeList() {
       _ = getMalformedEmployeeList()
            .sink { result in
                switch result {
                case let .failure(err):
                    print("DEBUG: error \(err)")
                case .finished:
                    break
                }
            } receiveValue: { employeeResponse in
                self.employees = nil
            }
    }
    
}
