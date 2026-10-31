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
            ScrollView {
                LazyVGrid(columns: cloumns) {
                    ForEach(MockData.frameworks, id: \.id) { framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                            }
                    }
                }
            }
            .navigationTitle("Frameworks")
            .sheet(isPresented: $viewModel.isShowingDetails) {
                FrameworkDetailsView(framework: viewModel.selectedFramework!, isShowingDetailsView: $viewModel.isShowingDetails)
            }
            
        }
    }
}

#Preview {
    FrameworkGrideView()
        .preferredColorScheme(.dark)
}

