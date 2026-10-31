//
//  AuthViewModel.swift
//  FirebaseAuth
//
//  Created by Admin on 30/10/26.
//

import Foundation
import FirebaseAuth  //Auth
import FirebaseFirestore  //storge

@MainActor
final class AuthViewModel: ObservableObject {

    @Published var userSession : FirebaseAuth.User? // firebase user
    @Published var currentUser : User? //apla user
    @Published var isError : Bool = false
    
    private var auth = Auth.auth()
    private var firestore = Firestore.firestore()

    init(){
        Task {
            await loadCurrentUser()
        }
    }
    
    func loadCurrentUser() async {
        if let user = auth.currentUser {
            await fetchUser(by: user.uid)
        } else {
            
        }
    }
    
    func login(email: String, password: String) async {
        do {
            let authResult = try await auth.signIn(withEmail: email, password: password)
            userSession = authResult.user
            await fetchUser(by: authResult.user.uid)
            print("Current User : \(currentUser)")
        } catch {
            isError = true
        }
    }
    
    func createUser(email: String, fullName: String, password: String) async {

        do {
            let authResult = try await auth.createUser(
                withEmail: email,
                password: password
            )

            print("Auth Success:", authResult.user.uid)

            await storeUserFireStore(
                uid: authResult.user.uid,
                email: email,
                fullName: fullName
            )

        } catch {
            isError = true
            print("Create User Error:", error.localizedDescription)
        }
    }
    
    func storeUserFireStore(uid: String, email: String, fullName: String) async {

        let user = User(uid: uid, email: email, fullName: fullName)

        print("User : \(user)")

        do {
            try firestore.collection("users")
                .document(uid)
                .setData(from: user)

            print("User successfully saved in Firestore!")

        } catch {
            isError = true
            print("Firestore Error:", error.localizedDescription)
        }
    }
    
    
    func fetchUser(by uid: String) async {
        do {
            let document = try await firestore.collection("users").document(uid).getDocument()
            currentUser = try document.data(as: User.self)
        } catch {
            isError = true
        }
    }
    
    func signOut(){
        do {
            userSession = nil 
            currentUser = nil
            try auth.signOut()
        } catch {
            isError = true
        }
    }
    
    func deleteAccount() async {
        do {
            userSession = nil
            currentUser = nil
            deleteUser(by: auth.currentUser?.uid ?? "") //first remove from firestore
            try await auth.currentUser?.delete() //then remove form auth
        } catch {
            isError = true
        }
    }
    
    private func deleteUser(by uid: String) {
         firestore.collection("users").document(uid).delete()
    }
}
