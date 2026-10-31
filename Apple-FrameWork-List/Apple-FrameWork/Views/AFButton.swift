//
//  AFButton.swift
//  Apple-FrameWork
//
//  Created by Admin on 21/09/26.
//

import SwiftUI

struct AFButton: View {
    var title : String
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 280, height: 50)
            .background(Color.red)
            .foregroundColor(.white)
            .frame(width: 280, height: 50)
            .cornerRadius(10)
    }
}

#Preview {
    AFButton(title: "Text Title")
}
