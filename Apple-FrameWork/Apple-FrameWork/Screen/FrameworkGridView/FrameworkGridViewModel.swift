//
//  FrameworkGridViewModel.swift
//  Apple-FrameWork
//
//  Created by Admin on 21/09/26.
//

import SwiftUI

final class FrameworkGridViewModel : ObservableObject {
    var selectedFramework : Framework?{
        didSet {
            isShowingDetails = true
        }
    }
    @Published var isShowingDetails = false
}
