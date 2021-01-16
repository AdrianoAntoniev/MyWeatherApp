//
//  WeatherModel.swift
//  MyWeatherApp
//
//  Created by Adriano Rodrigues Vieira on 15/01/21.
//

import Foundation

struct WeatherModel: Decodable {
    var cityName: String
    var temperature: Temperature
    var coordinate: Coordinates
    var weather: [Weather]
    
    private enum CodingKeys: String, CodingKey {
        case cityName = "name"
        case temperature = "main"
        case coordinate = "coord"
        case weather = "weather"
    }
    
    struct Temperature: Decodable {
        var value: Float
        var min: Float
        var max: Float
        var humidity: Int
        
        private enum CodingKeys: String, CodingKey {
            case value = "temp"
            case min = "temp_min"
            case max = "temp_max"
            case humidity = "humidity"
        }
    }

    struct Coordinates: Decodable {
        var latitude: Float
        var longitude: Float
        
        private enum CodingKeys: String, CodingKey {
            case latitude = "lat"
            case longitude = "lon"
        }
    }

    struct Weather: Decodable {
        var condition: String
        var description: String
        var icon: String
        
        private enum CodingKeys: String, CodingKey {
            case condition = "main"
            case description = "description"
            case icon = "icon"
        }
        
    }
}
