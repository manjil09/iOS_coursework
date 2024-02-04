//
//  DailyVC.swift
//  WeatherSense
//
//  Created by Student on 30/01/2024.
//

import UIKit

class DailyWeatherVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let apiService = APIService()
    var weatherList: [DailyWeatherDetails]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            super.viewDidLoad()
            
            let latitude = 27.7172
            let longitude = 85.324

            apiService.getDailyWeather(lat: latitude, lon: longitude) { [weak self] result in
                switch result {
                case .success(let dailyWeather):
                    
                    self?.weatherList = dailyWeather.data
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                case .failure(let error):
                    print("Error fetching current weather: \(error)")
                }
            }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DailyTVC", for: indexPath) as! DailyTVC
        
        let weatherData = weatherList?[indexPath.row]
        cell.tempLbl.text = "\(weatherData?.minTemp ?? 0)°C"
        cell.dateLbl.text = weatherData?.datetime ?? ""
        
        
        guard let imageUrl = weatherData?.weather?.icon else { return cell }
        cell.loadImg(imgUrl: imageUrl)
        return cell
    }
}
