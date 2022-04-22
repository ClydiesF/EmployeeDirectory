//
//  EmployeeRowView.swift
//  SquareTakeHomeApp
//
//  Created by clydies freeman on 4/20/22.
//

import Kingfisher
import SwiftUI

struct EmployeeRowView: View {
    var employee: Employee

    @State var shouldShowDetails: Bool = false

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .foregroundColor(.gray)
                    .frame(width: 80, height: 80, alignment: .center)
                KFImage(URL(string: employee.photo_url_small ?? ""))
                    .resizable()
                    .placeholder {
                        Image(systemName: "arrow.2.circlepath.circle")
                            .font(.largeTitle)
                            .opacity(0.3)
                    }
                    .frame(width: 80, height: 80, alignment: .center)
                    .clipShape(Circle())

                Circle()
                    .stroke(employee.employee_type.EmployeeTypeColor, lineWidth: 2)
                    .frame(width: 100, height: 100, alignment: .center)

                Image(systemName: employee.employee_type.EmployeeTypeIcon)
                    .padding(3)
                    .background(Circle().fill(.white)
                        .background(Circle().stroke(employee.employee_type.EmployeeTypeColor, lineWidth: 3)))
                    .foregroundColor(employee.employee_type.EmployeeTypeColor)
                    .offset(x: 35, y: 40)
            } // ZSTACK

            HStack {
                VStack(alignment: .leading) {
                    Text(employee.full_name)
                        .fontWeight(.bold)
                        .font(.caption)
                        .lineLimit(1)
                        .minimumScaleFactor(0.01)

                    Text(employee.team)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .textCase(.uppercase)
                        .font(.caption)
                        .lineLimit(1)
                        .minimumScaleFactor(0.01)
                }

                Spacer()

                Button {
                    withAnimation {
                        shouldShowDetails.toggle()
                    }

                } label: {
                    Image(systemName: "chevron.down")
                        .foregroundColor(employee.employee_type.EmployeeTypeColor)
                        .rotationEffect(.degrees(shouldShowDetails ? 180.0 : 0.0))
                }
            }
            .padding(.top, 10)

            if shouldShowDetails {
                VStack(spacing: 10) {
                    Divider()
                    HStack {
                        Image(systemName: "phone.circle")
                        Text("\(employee.phone_number ?? "N/A")")
                            .font(.caption)
                        Spacer()
                    }

                    HStack {
                        Image(systemName: "paperplane.circle")
                        Text("\(employee.email_address)")
                            .font(.caption)

                        Spacer()
                    }

                    HStack {
                        Text("Bio:")
                            .font(.body)
                            .textCase(.uppercase)

                        Spacer()
                    }

                    Text(employee.biography ?? "N/A")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(.white).shadow(color: .gray.opacity(0.3), radius: 5, x: 2, y: 2))
    }
}

struct EmployeeRowView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeRowView(employee: Employee.testEmployee)
            .previewLayout(.sizeThatFits)
            .frame(width: 160, height: 200, alignment: .center)
            .padding()
    }
}
