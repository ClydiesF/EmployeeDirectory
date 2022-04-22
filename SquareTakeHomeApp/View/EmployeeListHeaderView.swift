//
//  EmployeeListHeaderView.swift
//  SquareTakeHomeApp
//
//  Created by clydies freeman on 4/21/22.
//

import SwiftUI

struct EmployeeListHeaderView: View {
    let employeeCount: Int?
    
    var body: some View {
        HStack {
            Text(employeeCount != nil ? "Employees: \(employeeCount!)": "Seems we have no employees 🧐...")
                .fontWeight(.bold)
                .textCase(.uppercase)
            
        }
    }
}

struct EmployeeListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeListHeaderView(employeeCount: 5)
            .previewLayout(.sizeThatFits)
            .padding()
        EmployeeListHeaderView(employeeCount: nil)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
