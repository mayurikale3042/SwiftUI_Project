//
//  ProfileThreadsFilter.swift
//  ThreadsClone
//
//  Created by Admin on 27/09/26.
//

import Foundation

enum ProfileThreadsFilter : Int , CaseIterable, Identifiable {
    case threads
    case replies
    
    var title : String {
        switch self {
        case .threads : return "Threads"
        case .replies : return "Replies"
        }
    }
    var id: Int { return self.rawValue }
}
