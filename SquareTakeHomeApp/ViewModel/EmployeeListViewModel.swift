//
//  EmployeeListViewModel.swift
//  SquareTakeHomeApp
//
//  Created by clydies freeman on 4/20/22.
//

import Combine
import SwiftUI

class EmployeeListViewModel: ObservableObject, EmployeeService {
    var apiSession: APIService

    @Published var employees: [Employee]? = []

    var cancellables = Set<AnyCancellable>()

    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }

    func getEmployeeList() {
        let cancellable = getEmployeeList()
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
        cancellables.insert(cancellable)
    }

    func getMalformedEmployeeList() {
        let cancellable = getMalformedEmployeeList()
            .sink { result in
                switch result {
                case let .failure(err):
                    print("DEBUG: error \(err)")
                    self.employees = nil
                case .finished:
                    break
                }
            } receiveValue: { employeeResponse in
                self.employees = employeeResponse.employees
            }
        cancellables.insert(cancellable)
    }

    func getEmptyEmployeeList() {
        let cancellable = getEmptyEmployeeList()
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
        cancellables.insert(cancellable)
    }
}
