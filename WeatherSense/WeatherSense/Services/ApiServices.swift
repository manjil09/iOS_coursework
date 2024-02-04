//
//  ApiServices.swift
//  WeatherSense
//
//  Created by Student on 30/01/2024.
//

import Foundation

class APIService {
    private let baseURL = "https://weatherbit-v1-mashape.p.rapidapi.com"
    private let apiKey = "4433b8c9bcmsh567c2114d821c93p1b8766jsncd5d94c028ff"
    private let rapidAPIHost = "weatherbit-v1-mashape.p.rapidapi.com"
    
//    func getCurrentWeather(lat: Double, lon: Double, completion: @escaping (Result<CurrentWeatherData, Error>) -> Void) {
//        let urlString = "\(baseURL)/current?lat=\(lat)&lon=\(lon)"
//        performCurrentWeatherRequest(urlString: urlString, completion: completion)
//    }
    
    func getCurrentWeather(lat: Double, lon: Double, completion: @escaping (Result<CurrentWeatherData, Error>) -> Void) {
            let urlString = "lat=\(lat)&lon=\(lon)"
            performRequest(urlString: urlString, endpoint: .current, completion: completion)
    }
    
    func getDailyWeather(lat: Double, lon: Double, completion: @escaping (Result<DailyWeatherResponse, Error>) -> Void) {
        let urlString = "lat=\(lat)&lon=\(lon)"
        performRequest(urlString: urlString, endpoint: .daily, completion: completion)
    }
    
    func getHourlyWeather(lat: Double, lon: Double, completion: @escaping (Result<HourlyWeatherResponse, Error>) -> Void) {
        let urlString = "lat=\(lat)&lon=\(lon)&hours=24"
        performRequest(urlString: urlString, endpoint: .hourly, completion: completion)
    }
    
    private func performRequest<T: Decodable>(urlString: String, endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)\(endpoint.rawValue)?\(urlString)") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(apiKey, forHTTPHeaderField: "X-RapidAPI-Key")
        request.setValue(rapidAPIHost, forHTTPHeaderField: "X-RapidAPI-Host")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 1, userInfo: nil)))
                return
            }
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    enum Endpoint: String {
        case current = "/current"
        case daily = "/forecast/daily"
        case hourly = "/forecast/hourly"
    }
}
