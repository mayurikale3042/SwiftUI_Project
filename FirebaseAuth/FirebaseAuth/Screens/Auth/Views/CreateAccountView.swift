//
//  CreateAccountView.swift
//  FirebaseAuth
//
//  Created by Admin on 30/10/26.
//

import SwiftUI

struct CreateAccountView: View {
    
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @EnvironmentObject var authViewModel : AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationStack {
            VStack(spacing: 16) {
                
                //title
                Text("Please complete all information to create an account.")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.vertical)
                   
               
                //textfields
                TextFieldView(placeholder: "Enter Email or Phone", text: $email)
                TextFieldView(placeholder: "Enter Your Full Name", text: $fullname)
                TextFieldView(placeholder: "Enter your Password", isSecurityField: true, text: $password)
                
                ZStack(alignment: .trailing) {
                    TextFieldView(
                        placeholder: "Confirm Password",
                        isSecurityField: true,
                        text: $confirmPassword)
                    
                    Spacer()
                    
                    if !password.isEmpty && !confirmPassword.isEmpty {
                        Image(systemName: "\(isValidePassowrd ? "checkmark" : "xmark").circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundColor(isValidePassowrd ?
                                             Color(.systemGreen) :
                                             Color(.systemRed))
                    }
                }
                
                Spacer()
                //create account buttons
                Button {
                    Task {
                       await authViewModel.createUser(email: email, fullName: fullname, password: password)
                        if authViewModel.isError {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                } label: {
                    Text("Create Account")
                }
                .buttonStyle(CapsuleStyleButton())
            }
            .navigationTitle("Set up your Account")
            .toolbarRole(.editor)
        .padding(.horizontal)
        }
    }
    
    var isValidePassowrd : Bool {
        confirmPassword == password
    }
}

#Preview {
    CreateAccountView()
        .environmentObject(AuthViewModel())
}
