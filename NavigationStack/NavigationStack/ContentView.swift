//
//  ContentView.swift
//  NavigationStack
//
//  Created by Admin on 03/09/26.
//

import SwiftUI

struct ContentView: View {
    
    
    @ObservedObject var picsViewModel : PicsViewModel
    
    var body: some View {
        NavigationView {
            
            List(picsViewModel.picModel, id: \.self) { model in
                NavigationLink(destination: ImageContentView(url: model.downloadUrl ?? "", isDetailsView: false)) {
                    VStack {
                        ImageContentView(url: model.downloadUrl ?? "", isDetailsView: false)
                        HStack {
                            Text(model.id ?? "")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .padding()
                            
                            Text(model.author ?? "")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .padding()
                           
                        }
                    }
                }
            }
            .navigationTitle("Gallary")
            .onAppear {
                picsViewModel.loadData()
            }
        }
    }
}


#Preview {
    ContentView( picsViewModel: PicsViewModel())
}



struct ImageContentView: View {
    
    var url : String
    var isDetailsView : Bool
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            
            switch phase {
            case .empty :
                ProgressView()
                
            case .success(let image) :
                image.resizable()
                    .aspectRatio(contentMode: isDetailsView ? .fill : .fit)
                    .cornerRadius(isDetailsView ? 0 : 20)
                    .shadow(radius: 20)
                
            case .failure :
                Image(systemName: "photo")
                
            default :
                EmptyView()
            }
            
        }
    }
}
