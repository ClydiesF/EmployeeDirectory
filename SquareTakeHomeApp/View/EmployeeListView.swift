//
//  EmployeeListView.swift
//  SquareTakeHomeApp
//
//  Created by clydies freeman on 4/20/22.
//

import SwiftUI

struct EmployeeListView: View {
    @ObservedObject var viewModel = EmployeeListViewModel()
    let columns = [GridItem(), GridItem()]

    var body: some View {
        ScrollView {
            if viewModel.employees?.count == 0 {
                EmptyStateView(viewModel: viewModel)
            } else if viewModel.employees == nil {
                ErrorStateView(viewModel: viewModel)
            } else {
                
                HStack {
                    Button {
                        print("Refresh")
                        self.viewModel.getEmployeeList()
                    } label: {
                        Text("Employee")
                            .font(.body)
                            .foregroundColor(.white)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Capsule().fill(.orange))
                    
                    Button {
                        print("malform")
                        self.viewModel.getMalformedEmployeeList()
                    } label: {
                        Text("malform")
                            .font(.body)
                            .foregroundColor(.white)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Capsule().fill(.pink))
                    Button {
                        print("empty")
                        self.viewModel.getEmptyEmployeeList()
                    } label: {
                        Text("empty")
                            .font(.body)
                            .foregroundColor(.white)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Capsule().fill(.indigo))
                }
               

                LazyVGrid(columns: columns, alignment: .center, spacing: 10, pinnedViews: [.sectionHeaders], content: {
                    Section {
                        EmployeeListHeaderView(employeeCount: viewModel.employees?.count)
                    }
                    ForEach(viewModel.employees ?? [], id: \.uuid) { employee in
                        EmployeeRowView(employee: employee)
                    }
                })
                    .padding(.horizontal)
            }
        }
        .onAppear {
            self.viewModel.getEmployeeList()
        }
    }
}

struct EmployeeListView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeListView()
    }
}
