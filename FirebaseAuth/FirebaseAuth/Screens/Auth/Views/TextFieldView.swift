//
//  TextFieldView.swift
//  FirebaseAuth
//
//  Created by Admin on 30/10/26.
//

import SwiftUI

struct TextFieldView: View {
    
    let placeholder : String
    var isSecurityField : Bool = false
   @Binding var text : String
    
    var body: some View {
        VStack(spacing: 12){
            if isSecurityField {
                SecureField(placeholder, text: $text)
            } else {
                TextField(placeholder, text: $text)
            }
            Divider()
              
        }
    }
}

#Preview {
    TextFieldView(placeholder: "Enter Email", text: .constant(""))
}
