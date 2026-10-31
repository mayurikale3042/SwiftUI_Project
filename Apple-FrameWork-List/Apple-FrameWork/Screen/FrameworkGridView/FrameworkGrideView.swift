//
//  FrameworkGrideView.swift
//  Apple-FrameWork
//
//  Created by Admin on 21/09/26.
//

import SwiftUI

struct FrameworkGrideView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    let cloumns : [GridItem] = [GridItem(.flexible()),                                                     GridItem(.flexible()),                                                     GridItem(.flexible())
    ]
    

    
    var body: some View {
        NavigationView {
            List {
                ForEach(MockData.frameworks, id: \.id) { framework in
                    NavigationLink(destination: FrameworkDetailsView(framework: framework, isShowingDetailsView: $viewModel.isShowingDetails)) {
                        FrameworkTitleView(framework: framework)
                    }
                }
            }
            .navigationTitle("Frameworks")
        }
        .accentColor(Color(.label))
    }
}

#Preview {
    FrameworkGrideView()
        .preferredColorScheme(.dark)
}

