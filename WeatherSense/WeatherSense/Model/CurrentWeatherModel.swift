//
//  CurrentWeatherModel.swift
//  WeatherSense
//
//  Created by Student on 30/01/2024.
//

import Foundation

struct CurrentWeatherData: Codable {
    let count: Int?
    let data: [CurrentWeatherDetails]?
}

struct CurrentWeatherDetails: Codable {
    let appTemp: Double?
    let aqi: Double?
    let cityName: String?
    let clouds: Double?
    let countryCode: String?
    let datetime: String?
    let dewpt: Double?
    let dhi: Double?
    let dni: Double?
    let elevAngle: Double?
    let ghi: Double?
    let gust: Double?
    let hAngle: Double?
    let lat: Double?
    let lon: Double?
    let obTime: String?
    let pod: String?
    let precip: Double?
    let pres: Double?
    let rh: Double?
    let slp: Double?
    let snow: Double?
    let solarRad: Double?
    let sources: [String]?
    let stateCode: String?
    let station: String?
    let sunrise: String?
    let sunset: String?
    let temp: Double?
    let timezone: String?
    let ts: Double?
    let uv: Double?
    let vis: Double?
    let weather: CurrentWeatherInfo?
    let windCdir: String?
    let windCdirFull: String?
    let windDir: Double?
    let windSpd: Double?

    enum CodingKeys: String, CodingKey {
        case appTemp = "app_temp"
        case aqi
        case cityName = "city_name"
        case clouds
        case countryCode = "country_code"
        case datetime
        case dewpt
        case dhi
        case dni
        case elevAngle = "elev_angle"
        case ghi
        case gust
        case hAngle = "h_angle"
        case lat
        case lon
        case obTime = "ob_time"
        case pod
        case precip
        case pres
        case rh
        case slp
        case snow
        case solarRad = "solar_rad"
        case sources
        case stateCode = "state_code"
        case station
        case sunrise
        case sunset
        case temp
        case timezone
        case ts
        case uv
        case vis
        case weather
        case windCdir = "wind_cdir"
        case windCdirFull = "wind_cdir_full"
        case windDir = "wind_dir"
        case windSpd = "wind_spd"
    }
}

struct CurrentWeatherInfo: Codable {
    let description: String?
    let code: Int?
    let icon: String?
}
