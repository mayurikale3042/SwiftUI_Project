//
//  ContentView.swift
//  FirebaseAuth
//
//  Created by Admin on 28/10/26.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel : AuthViewModel
    
    var body: some View {
        Group {
            if authViewModel.userSession == nil {
                LoginView()
            } else {
                ProfileView()
            }
        }
            .environmentObject(authViewModel)
    }
}

#Preview {
    ContentView()
}

