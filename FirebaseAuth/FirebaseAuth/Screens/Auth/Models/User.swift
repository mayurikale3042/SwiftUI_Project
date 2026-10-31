//
//  User.swift
//  FirebaseAuth
//
//  Created by Admin on 30/10/26.
//

import Foundation


struct User : Codable {
    let uid : String
    let email : String
    let fullName : String
    
    var initials : String {
        let formatter = PersonNameComponentsFormatter()
        if let componants = formatter.personNameComponents(from: fullName) {
            formatter.style = .abbreviated
            return formatter.string(from: componants)
          }
        return ""
    }
}
