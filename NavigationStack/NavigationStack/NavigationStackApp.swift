//
//  NavigationStackApp.swift
//  NavigationStack
//
//  Created by Admin on 03/09/26.
//

import SwiftUI

@main
struct NavigationStackApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView( picsViewModel: PicsViewModel())
        }
    }
}
