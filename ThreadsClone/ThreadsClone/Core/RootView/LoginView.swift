//
//  LoginView.swift
//  ThreadsClone
//
//  Created by Admin on 24/09/26.
//




import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image(systemName: "threads_img")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                
                VStack {
                    TextField("Enter Your Email", text: $email)
                        .autocapitalization(.none)
                        .modifier(ThreadsTextFieldsModifiers())
                    
                    SecureField("Enter Your Passowrd", text: $password)
                        .modifier(ThreadsTextFieldsModifiers())
                }
                
                NavigationLink {
                    Text("Forget Password")
                } label: {
                    Text("Forget Password")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing, 28)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                
                Button(action: {
                    ThreadsTabView()
                        .navigationBarBackButtonHidden(true)
                }, label: {
                    Text("Login")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .frame(width: 352, height: 48)
                        .background(.black)
                        .cornerRadius(10)
                })
                
                Spacer()
                
                Divider()
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack {
                        Text("Don't have an account ?")
                            .font(.subheadline)
                            .padding()
                        
                        Text("Sign Up")
                            .font(.subheadline)
                            .padding()
                    }
                    .foregroundColor(.black)
                    .font(.footnote)
                }
                .padding(.vertical, 16)
            }
        }
    }
}




#Preview {
    LoginView()
}
