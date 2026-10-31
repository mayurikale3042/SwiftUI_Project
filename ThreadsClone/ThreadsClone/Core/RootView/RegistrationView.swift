//
//  RegistrationView.swift
//  ThreadsClone
//
//  Created by Admin on 25/09/26.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    @State private var username = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "threads_img ")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            VStack {
                TextField("Enter Your Email", text: $email)
                    .modifier(ThreadsTextFieldsModifiers())
                
                SecureField("Enter Your Passowrd", text: $password)
                    .modifier(ThreadsTextFieldsModifiers())
                
                TextField("Enter Your Fullname", text: $fullName)
                    .modifier(ThreadsTextFieldsModifiers())
                
                TextField("Enter Your UserName", text: $username)
                    .modifier(ThreadsTextFieldsModifiers())
            }
            Button(action: {
                
            }, label: {
                Text("Sign up")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .frame(width: 352, height: 48)
                    .background(Color.black)
                    .cornerRadius(10)
            })
            .padding(.vertical)
            Spacer()
            
            Button(action: {
                dismiss()
            }, label: {
                VStack {
                Text("Already have an account ?")
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal,24)
                
                Text("SignIn")
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .padding(.horizontal, 24)
            }
                .foregroundColor(.black)
                .font(.footnote)
                   
            })
        }
    }
}

#Preview {
    RegistrationView()
}
