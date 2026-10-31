//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by Admin on 26/09/26.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var selectedFilter : ProfileThreadsFilter = .threads
    @Namespace var animation
    
    private var filterbarWidth : CGFloat {
        let count = CGFloat(ProfileThreadsFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            Spacer()
            //bio and state
            VStack(spacing: 20){
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 12){
                        //Full Name and Username
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Radha Yadav")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text("radhay_21")
                                .font(.subheadline)
                            
                        }
                        
                        Text("ODI world cup winner Cricketer")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Text("2 Followers")
                            .font(.caption)
                            .foregroundStyle(Color.gray)
                    }
                    Spacer()
                    CircularProfileImage()
                }
                
                Button(action: {
                    
                }, label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 360, height: 32)
                        .background(.black)
                        .cornerRadius(8)
                })
                
                //user content view list
                VStack {
                    HStack {
                        ForEach(ProfileThreadsFilter.allCases) { filter in
                            VStack {
                                Text(filter.title)
                                    .font(.subheadline)
                                    .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                
                                if selectedFilter == filter {
                                    Rectangle()
                                        .foregroundColor(.black)
                                        .frame(width: filterbarWidth, height: 1)
                                        .matchedGeometryEffect(id: "item", in: animation)
                                } else {
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: filterbarWidth, height: 1)
                                }
                            }
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selectedFilter = filter
                                }
                            }
                        }
                    }
                    LazyVStack {
                        ForEach(0 ... 10 , id: \.self) { threads in
                        ThreadCell()
                        }
                    }
                }
                .padding(.vertical, 8)
            }
        }
        .padding(.horizontal)
        .refreshable {
            print("Profile refresh Succesfull")
        }
    }
}


#Preview {
    ProfileView()
}
