//
//  ErrorStateView.swift
//  SquareTakeHomeApp
//
//  Created by clydies freeman on 4/21/22.
//

import SwiftUI

struct ErrorStateView: View {
    @ObservedObject var viewModel: EmployeeListViewModel
    
    var body: some View {
        VStack {
            Image(systemName: "trash")
                .foregroundColor(.gray)
                .font(.system(size: 80))
            Text("Error with the Data")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Button {
                self.viewModel.getEmployeeList()
            } label: {
                Text("lets fetch again!")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 10)
            .background(Capsule().fill(.mint).shadow(color: .gray.opacity(0.3), radius: 5, x: 2, y: 2))
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(.white).shadow(color: .gray.opacity(0.6), radius: 5, x: 2, y: 2))
        .padding()
    }
}

struct ErrorStateView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorStateView(viewModel: EmployeeListViewModel())
    }
}
