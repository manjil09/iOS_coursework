//
//  HourlyTVC.swift
//  WeatherSense
//
//  Created by Student on 30/01/2024.
//

import UIKit

class HourlyTVC: UITableViewCell {

    @IBOutlet weak var uiView: UIView!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var visibilityLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
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

}
