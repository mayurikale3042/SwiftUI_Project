//
//  CapsuleButton.swift
//  FirebaseAuth
//
//  Created by Admin on 30/10/26.
//

import SwiftUI


struct CapsuleStyleButton : ButtonStyle{
    var bgColor: Color = .teal
    var textColor : Color = .white
    var hasborder : Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(textColor)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Capsule().fill(bgColor))
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .overlay {
                hasborder ?
                Capsule()
                    .stroke(.gray ,lineWidth: 1)
                : nil
            }
    }
}

