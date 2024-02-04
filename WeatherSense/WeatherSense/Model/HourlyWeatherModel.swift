//
//  HourlyWeatherModel.swift
//  WeatherSense
//
//  Created by Student on 30/01/2024.
//

import Foundation

struct HourlyWeatherResponse: Codable {
    let cityName: String?
    let countryCode: String?
    let data: [HourlyWeatherData]?
    
    enum CodingKeys: String, CodingKey {
        case cityName = "city_name"
        case countryCode = "country_code"
        case data
    }
}

struct HourlyWeatherData: Codable {
    let appTemp: Double?
    let clouds: Double?
    let cloudsHi, cloudsLow, cloudsMid: Double?
    let datetime: String?
    let dewpt, dhi, dni, ghi: Double?
    let ozone: Double?
    let pod: String?
    let pop, precip, pres: Double?
    let rh: Double?
    let slp: Double?
    let snow, snowDepth: Double?
    let solarRad: Double?
    let temp: Double?
    let timestampLocal, timestampUTC: String?
    let ts: Double?
    let uv: Double?
    let vis: Double?
    let weather: HourlyWeather?
    let windCdir, windCdirFull: String?
    let windDir: Double?
    let windGustSpd, windSpd: Double?
    
    enum CodingKeys: String, CodingKey {
        case appTemp = "app_temp"
        case clouds
        case cloudsHi = "clouds_hi"
        case cloudsLow = "clouds_low"
        case cloudsMid = "clouds_mid"
        case datetime, dewpt, dhi, dni, ghi, ozone, pod, pop, precip, pres, rh, slp, snow
        case snowDepth = "snow_depth"
        case solarRad = "solar_rad"
        case temp
        case timestampLocal = "timestamp_local"
        case timestampUTC = "timestamp_utc"
        case ts, uv, vis, weather
        case windCdir = "wind_cdir"
        case windCdirFull = "wind_cdir_full"
        case windDir = "wind_dir"
        case windGustSpd = "wind_gust_spd"
        case windSpd = "wind_spd"
    }
}

struct HourlyWeather: Codable {
    let description: String?
    let code: Int?
    let icon: String?
}
