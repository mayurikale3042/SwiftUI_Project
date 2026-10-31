//
//  ExploreView.swift
//  ThreadsClone
//
//  Created by Admin on 26/09/26.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(0 ... 10 , id: \.self) { user in
                        VStack {
                           UserCell()
                            
                            Divider()
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .refreshable {
                print("Explore View Refresh")
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.automatic)
            .searchable(text: $searchText, prompt: "Search")
        }
    }
}


#Preview {
    ExploreView()
}
