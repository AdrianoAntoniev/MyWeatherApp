//
//  WeatherData.swift
//  MyWeatherApp
//
//  Created by Adriano Rodrigues Vieira on 15/01/21.
//

import Foundation
import Combine

class WeatherData: ObservableObject {
    private let apiKey = "SUA API KEY"
    private let city = "Guarulhos"
    
    @Published var model: WeatherModel?
    
    init() {
        let urlString = "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&lang=pt&units=metric"

        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let weatherData = data {
                    do {
                        let weatherDecoded = try JSONDecoder().decode(WeatherModel.self, from: weatherData)
                        
                        DispatchQueue.main.async {
                            self.model = weatherDecoded
                        }
                    } catch {
                        print("Mamma mia! \(error)")
                    }
                }
            }
            
            task.resume()
        }
    }
}
