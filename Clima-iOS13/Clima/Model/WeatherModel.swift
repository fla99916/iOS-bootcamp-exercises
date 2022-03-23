//
//  WeatherModel.swift
//  Clima
//
//  Created by Yelim Kim on 2/1/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String {
        switch conditionId {
        case 200...232: //Thunderstorm
            return "cloud.bolt.fill"
        case 300...321: // Drizzle
            return "cloud.hail.fill"
        case 500...531: //Rain
            return "cloud.rain.fill"
        case 600...622: // Snow
            return "snowflake"
        case 701...781: //Atmosphere
            return "humidity.fill"
        case 800: //Clear
            return "sun.max.fill"
        case 801...804: //Clouds
            return "cloud.fill"
        default:
            return "sun.min.fill"
        }
        
    }
}
