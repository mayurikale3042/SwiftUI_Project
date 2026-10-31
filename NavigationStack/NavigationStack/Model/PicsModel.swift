//
//  PicsModel.swift
//  NavigationStack
//
//  Created by Admin on 05/09/26.
//

import Foundation


struct PicsModel : Codable , Identifiable, Hashable {
    var id  : String?
    var author : String?
    var downloadUrl : String?
    
    enum CodingKeys : String, CodingKey {
        case id, author
        case downloadUrl = "download_url"
    }
}


