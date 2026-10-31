//
//  PicsViewModel.swift
//  NavigationStack
//
//  Created by Admin on 05/09/26.
//

import Foundation
import SwiftUI

class PicsViewModel : ObservableObject {
    
    @Published var picModel = [PicsModel]()
    
    func loadData(){
        guard let url = URL(string: "https://picsum.photos/v2/list") else {
            print("Invalid URL")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let modelData = try? JSONDecoder().decode([PicsModel].self, from: data!)
            
            DispatchQueue.main.async {
                if let model = modelData {
                    self.picModel = model
                }
            }
        }.resume()
    }
}
