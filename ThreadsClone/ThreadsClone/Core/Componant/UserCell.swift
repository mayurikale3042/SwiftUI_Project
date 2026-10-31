//
//  UserCell.swift
//  ThreadsClone
//
//  Created by Admin on 26/09/26.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            CircularProfileImage()
            
            VStack(alignment: .leading) {
                Text("radhay_1")
                    .fontWeight(.semibold)
                
                Text("Radha Yadav")

            }
            .font(.footnote)
            Spacer()
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray), lineWidth : 1)
                }
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCell()
}
