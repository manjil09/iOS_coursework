//
//  HourlyWeatherVC.swift
//  WeatherSense
//
//  Created by Student on 30/01/2024.
//

import UIKit

class HourlyWeatherVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    let apiService = APIService()
    var weatherList: [HourlyWeatherData]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let latitude = 27.7172
        let longitude = 85.324

        apiService.getHourlyWeather(lat: latitude, lon: longitude) { [weak self] result in
            switch result {
            case .success(let hourlyWeather):
                
                self?.weatherList = hourlyWeather.data
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "HourlyTVC", for: indexPath) as! HourlyTVC
        
        let weatherData = weatherList?[indexPath.row]
        let time = weatherData?.timestampLocal ?? ""
        if(time.count>0){
            let startIndex = time.index(time.startIndex, offsetBy: 11)
            let endIndes = time.index(time.startIndex, offsetBy: 15)
            
            cell.timeLbl.text = String(time[startIndex...endIndes])
        }else{
            cell.timeLbl.text = weatherData?.timestampLocal
        }
        
        cell.tempLbl.text = "\(weatherData?.temp ?? 0)°C"
        cell.visibilityLbl.text = "\(weatherData?.vis ?? 0)"
        
        guard let imageUrl = weatherData?.weather?.icon else { return cell }
        cell.loadImg(imgUrl: imageUrl)
        return cell
    }

}
