//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by Admin on 17/09/26.
//

import SwiftUI


struct WeatherButton : View {
    var title : String
    var textcolor : Color
    var backgroundColor : Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundStyle(textcolor)
            .font(.system(size: 20, weight: .bold, design : .default))
            .cornerRadius(10)
    }
}

//struct WeatherButton_Priview : PreviewProvider {
//    static var priviews : some view {
//
//    }
//    
//}
