//
//  CircularProfileImage.swift
//  ThreadsClone
//
//  Created by Admin on 26/09/26.
//

import SwiftUI

struct CircularProfileImage: View {
    
    var body: some View {
        Image("radha_img")
            .resizable()
            .frame(width: 50, height: 50)
            .clipShape(Circle())
    }
}

#Preview {
    CircularProfileImage()
}
