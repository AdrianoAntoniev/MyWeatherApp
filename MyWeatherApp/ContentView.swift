//
//  ContentView.swift
//  MyWeatherApp
//
//  Created by Adriano Rodrigues Vieira on 15/01/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    let conditions: [String: String] =
    [
        "Thunderstorm": "cloud.bolt.rain.fill",
        "Drizzle": "cloud.drizzle.fill",
        "Rain": "cloud.rain.fill",
        "Snow": "snow",
        "Mist": "cloud.fog.fill",
        "Smoke": "smoke.fill",
        "Haze": "sun.haze.fill",
        "Dust": "sun.dust.fill",
        "Fog": "cloud.fog.fill",
        "Sand": "cloud.fog.fill",
        "Ash": "smoke.fill",
        "Squall": "cloud.heavyrain.fill",
        "Tornado": "tornado",
        "Clear": "sun.max.fill",
        "Clouds": "cloud.fill",
    ]
    
    @ObservedObject var weatherData = WeatherData()
    
    var body: some View {
        VStack {
            HStack {
                Text(weatherData.model?.cityName ?? "nil")
                    .fontWeight(.bold)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                Spacer()
                Text(String(format: "%.1f", weatherData.model?.temperature.value ?? 0)+"°C")
                    .fontWeight(.bold)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            .padding(30)
            
            let condition = weatherData.model?.weather.first?.condition ?? "Clear"
            Image(systemName: conditions[condition]!)
                .resizable()
                .frame(width: 150, height: 150)
            
            Text("Umidade: \(weatherData.model?.temperature.humidity ?? 0)%")
                .fontWeight(.heavy)
                .font(.subheadline)
                .italic()
                .padding(.trailing)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
