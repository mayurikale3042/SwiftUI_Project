//
//  ThreadsTextFieldsModifiers.swift
//  ThreadsClone
//
//  Created by Admin on 25/09/26.
//

import SwiftUI

struct ThreadsTextFieldsModifiers : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
