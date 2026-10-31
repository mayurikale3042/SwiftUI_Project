//
//  ContentView.swift
//  WeatherApp
//
//  Created by Admin on 15/09/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack {
                CityTextView(cityName: "Pune, India")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: "76")
                
        
                
                HStack(spacing: 20) {
                    
                    
                    WeatherSubview(arrDay: "Mon",
                                   arrImage: "sun.max.fill",
                                   arrtemp: "35")
                    
                    WeatherSubview(arrDay: "Tue",
                                   arrImage: "wind.snow",
                                   arrtemp: "60")
                    
                    WeatherSubview(arrDay: "Wed",
                                   arrImage: "sunset.fill",
                                   arrtemp: "50")
                    
                    WeatherSubview(arrDay: "Thu",
                                   arrImage: "snowflake",
                                   arrtemp: "44")
                    
                    WeatherSubview(arrDay: "Fri",
                                   arrImage: "cloud.sun.fill",
                                   arrtemp: "40")
                    
                    WeatherSubview(arrDay: "Sat",
                                   arrImage: "wind",
                                   arrtemp: "55")
                    
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textcolor: .blue, backgroundColor: .white)
                }
                Spacer()
            }
        }
     }
}

#Preview {
    ContentView()
}



struct WeatherSubview: View {
    var arrDay : String
    var arrImage : String
    var arrtemp : String
    
    var body: some View {
        
        VStack {
            
            Text(arrDay)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundStyle(.white)
            Image(systemName: arrImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text(arrtemp)
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.white)
            
        }
    }
}

struct BackgroundView: View {
    var isNight : Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName : String
    
    var body : some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherStatusView : View {
    var imageName : String
    var temp : String
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text(temp)
                .font(.system(size: 40, weight: .medium, design: .default))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
}

