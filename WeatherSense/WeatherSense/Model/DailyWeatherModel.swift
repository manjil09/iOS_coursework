//
//  DailyWeatherModel.swift
//  WeatherSense
//
//  Created by Student on 30/01/2024.
//

import Foundation

struct DailyWeatherResponse: Codable {
    let cityName: String?
    let countryCode: String?
    let data: [DailyWeatherDetails]?
    let lat: Double?
    let lon: Double?
    let stateCode: String?
    let timezone: String?

    enum CodingKeys: String, CodingKey {
        case cityName = "city_name"
        case countryCode = "country_code"
        case data
        case lat
        case lon
        case stateCode = "state_code"
        case timezone
    }
}

// Nested model for weather details
struct DailyWeatherDetails: Codable {
    let appMaxTemp: Double?
    let appMinTemp: Double?
    let clouds: Double?
    let datetime: String?
    let dewpt: Double?
    let highTemp: Double?
    let lowTemp: Double?
    let maxTemp: Double?
    let minTemp: Double?
    let weather: DailyWeatherInfo?

    enum CodingKeys: String, CodingKey {
        case appMaxTemp = "app_max_temp"
        case appMinTemp = "app_min_temp"
        case clouds
        case datetime
        case dewpt
        case highTemp = "high_temp"
        case lowTemp = "low_temp"
        case maxTemp = "max_temp"
        case minTemp = "min_temp"
        case weather
    }
}

// Nested model for weather information
struct DailyWeatherInfo: Codable {
    let code: Int?
    let icon: String?
    let description: String?
}
