//
//  FrameworkDetailsView.swift
//  Apple-FrameWork
//
//  Created by Admin on 21/09/26.
//

import SwiftUI

struct FrameworkDetailsView: View {
    var framework : Framework
    @Binding var isShowingDetailsView : Bool
    @State private var isShowingSafriView = false
    
    var body: some View {
        VStack {
         
            
            Spacer()
            
            FrameworkTitleView(framework: framework)
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button(action : {
             isShowingSafriView = true
            }, label: {
                AFButton(title: "Learn More")
            })
        }
        .sheet(isPresented: $isShowingSafriView, content: {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
        })
    }
}

#Preview {
    FrameworkDetailsView(framework: MockData.sampleFramework, isShowingDetailsView: .constant(false))
        .preferredColorScheme(.dark)
}
