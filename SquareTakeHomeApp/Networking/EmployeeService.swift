//
//  employeeService.swift
//  SquareTakeHomeApp
//
//  Created by clydies freeman on 4/20/22.
//

import Foundation
import Combine

protocol EmployeeService {
    var apiSession: APIService {get}

    func getEmployeeList() -> AnyPublisher<Employees, APIError>
    
    func getMalformedEmployeeList() -> AnyPublisher<Employees, APIError>
    
    func getEmptyEmployeeList() -> AnyPublisher<Employees, APIError>
}

extension EmployeeService {
    
    func getEmployeeList() -> AnyPublisher<Employees, APIError> {
        return apiSession.request(with: EmployeeEndpoint.employeeList)
            .eraseToAnyPublisher()
    }
    
    func getMalformedEmployeeList() -> AnyPublisher<Employees, APIError> {
        return apiSession.request(with: EmployeeEndpoint.malformed)
            .eraseToAnyPublisher()
    }
    
    func getEmptyEmployeeList() -> AnyPublisher<Employees, APIError> {
        return apiSession.request(with: EmployeeEndpoint.empty)
            .eraseToAnyPublisher()
    }
}

enum EmployeeEndpoint {
    case employeeList
    case malformed
    case empty
}

extension EmployeeEndpoint: RequestBuilder {
    
    var urlRequest: URLRequest {
        var requestURL: URL
        
        switch self {
        case .employeeList:
            guard let url = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees.json")
                else {preconditionFailure("Invalid URL format")}
            requestURL = url
        case .malformed:
            guard let url = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees_malformed.json")
                else {preconditionFailure("Invalid URL format")}
            requestURL = url
        case .empty:
            guard let url = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees_empty.json")
                else {preconditionFailure("Invalid URL format")}
            requestURL = url
        }
        return URLRequest(url: requestURL)
    }
}
