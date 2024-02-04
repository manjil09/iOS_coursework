//
//  DailyTVC.swift
//  WeatherSense
//
//  Created by Student on 30/01/2024.
//

import UIKit

class DailyTVC: UITableViewCell {

    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
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
                    self.weatherImage.image = image
                }
            }
        }.resume()
    }
}
