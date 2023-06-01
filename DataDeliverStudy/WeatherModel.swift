//
//  WeatherModel.swift
//  DataDeliverStudy
//
//  Created by jhchoi on 2023/06/01.
//

import Foundation

struct WeatherModel: Codable {
    
    let weather: [Weather]
    let main: Main
    let name: String
    
}

struct Weather: Codable {
    let description: String
}

struct Main: Codable {
    let temp: Double
    let feelsLike: Double
    let minTemp: Double
    let maxTemp: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case minTemp = "temp_min"
        case maxTemp = "temp_max"
    }
}
