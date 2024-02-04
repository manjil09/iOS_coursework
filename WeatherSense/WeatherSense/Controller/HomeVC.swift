//
//  ViewController.swift
//  WeatherSense
//
//  Created by Student on 30/01/2024.
//

import UIKit
import CoreLocation
//np01ma4a210003@islingtoncollege.edu.np
class HomeVC: UIViewController{
    
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var airQualityLbl: UILabel!
    @IBOutlet weak var pressureLbl: UILabel!
    @IBOutlet weak var uvLbl: UILabel!
    @IBOutlet weak var precepLbl: UILabel!
    @IBOutlet weak var windLbl: UILabel!
    @IBOutlet weak var visibilityLbl: UILabel!
    @IBOutlet weak var sunriseLbl: UILabel!
    @IBOutlet weak var susetLbl: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    
    var latitude:Double = 0.0
    var longitude:Double = 0.0
    
    let apiService = APIService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        latitude = 27.7172
        longitude = 85.324
        
//        self.getLocation()
        
        apiService.getCurrentWeather(lat: latitude, lon: longitude) { [weak self] result in
            switch result {
            case .success(let currentWeather):
                
                let temperature = currentWeather.data?[0].temp ?? 0
                let desc = currentWeather.data?[0].weather?.description
                
                let airQuality = currentWeather.data?[0].dewpt
                let pressure = currentWeather.data?[0].pres
                let uv = currentWeather.data?[0].uv
                let precepitation = currentWeather.data?[0].precip
                let wind = currentWeather.data?[0].windSpd
                let visibility = currentWeather.data?[0].vis
                
                let sunrise = currentWeather.data?[0].sunrise
                let sunset = currentWeather.data?[0].sunset
                let imgUrl = currentWeather.data?[0].weather?.icon
                
                DispatchQueue.main.async {
                    self?.tempLbl.text = "\(temperature)°C"
                    self?.descLbl.text = desc
                    self?.airQualityLbl.text = "\(airQuality ?? 0)"
                    self?.pressureLbl.text = "\(pressure ?? 0)"
                    self?.uvLbl.text = "\(uv ?? 0)"
                    self?.precepLbl.text = "\(precepitation ?? 0)"
                    self?.windLbl.text = "\(wind ?? 0)"
                    self?.visibilityLbl.text = "\(visibility ?? 0)"
                    self?.sunriseLbl.text = sunrise
                    self?.susetLbl.text = sunset
                    self?.loadImg(imgUrl: imgUrl ?? "")
                }
            case .failure(let error):
                print("Error fetching current weather: \(error)")
            }
        }
    }
    
    func loadImg(imgUrl:String){
        let url = "https://cdn.weatherbit.io/static/img/icons/\(imgUrl).png"
            if let imageUrl = URL(string: url){
                downloadImage(from: imageUrl)
            }
        }
        
    func downloadImage(from imageUrl: URL){
        URLSession.shared.dataTask(with: imageUrl){data, response, error in
            if let data = data, let image = UIImage(data: data){
                DispatchQueue.main.async {
                    self.weatherIcon.image = image
                }
            }
        }.resume()
    }
    
    //this method does not work as expected
    func getLocation(){
        let locationService = LocationService.shared
        DispatchQueue.main.async {
            locationService.locate { result in
                switch result {
                case .Success(let locationService):
                    if let latitude = locationService?.coordinate.latitude,
                       let longitude = locationService?.coordinate.longitude {
                        self.longitude = longitude
                        self.latitude = latitude
                        print("Latitude: \(latitude), Longitude: \(longitude)")
                    } else {
                        print("Unable to retrieve location coordinates.")
                    }
                case .Failure(let error):
                    print("Error getting location: \(error.localizedDescription)")
                }
            }
        }

    }
}

