//
//  LoginView.swift
//  FirebaseAuth
//
//  Created by Admin on 30/10/26.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var authViewModel : AuthViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    //logo
                    logo
                    //title
                    titleView
                    Spacer().frame(height: 12)
                    //textFields
                    TextFieldView(
                        placeholder: "Enter Email or Mobile",
                        text: $email)
                    
                    TextFieldView(
                        placeholder: "Password",
                        isSecurityField: true,
                        text: $password)
                    
                    //forgot button
                    forgotButton
                    //loginButton
                    loginButton
                    //Bottom View -- or
                    fotterView
                    //footer
                    NavigationLink {
                        CreateAccountView()
                            .environmentObject(authViewModel)
                    } label: {
                        HStack {
                            Text("Don't have an account")
                                .foregroundStyle(.black)
                            Text("Sign up")
                                .foregroundStyle(.teal)
                        }
                        .fontWeight(.medium)
                    }
                }
            }
            .ignoresSafeArea()
            .padding(.horizontal)
            .padding(.vertical, 12)
            .alert("Something Went Wrong", isPresented: $authViewModel.isError) {}
        }
    }
    
    
    private var logo : some View {
        Image("login_image")
            .resizable()
            .scaledToFit()
    }
    
    private var titleView : some View {
        Text("Let's Connect With US!")
            .font(.title2)
            .fontWeight(.semibold)
    }
  
    
    private var forgotButton : some View {
        HStack {
            Spacer()
            Button(action: {
                
            }, label: {
                Text("Forget Password?")
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
            })
        }
    }
    
    private var loginButton : some View {
        Button {
            Task {
                await authViewModel.login(email: email,password: password)
            }
        } label: {
            Text("Login")
        }
        .buttonStyle(CapsuleStyleButton())
    }
    
    private var fotterView : some View {
        VStack(spacing: 16) {
            lineorView
            appleButton
            googleButton
        }
    }
    
    private var lineorView : some View {
        HStack(spacing: 16) {
            line
            Text("or")
                .fontWeight(.semibold)
            line
        }
        .foregroundStyle(.gray)
    }
    
    private var appleButton : some View {
        Button(action: {
            
        }, label: {
            Label("Sign up with Apple", systemImage: "apple.logo")
        })
        .buttonStyle(CapsuleStyleButton(bgColor: .black))
    }
    
    private var googleButton : some View {
        Button(action: {
            
        }, label: {
            HStack {
                Image("google_img")
                    .resizable()
                    .frame(width: 15, height: 15)
                Text("Sign up with Google")
            }
        })
        .buttonStyle(CapsuleStyleButton(bgColor: .clear, textColor: .black, hasborder : true))
    }
    
    private var line : some View{
        VStack {Divider().frame(height: 1)}
    }
    
}

#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
}

