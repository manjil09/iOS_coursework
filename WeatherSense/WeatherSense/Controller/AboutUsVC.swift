//
//  AboutUsVC.swift
//  WeatherSense
//
//  Created by Student on 30/01/2024.
//

import UIKit
import MessageUI
import Foundation

class AboutUsVC: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func emailUsClicked(_ sender: Any) {
        
        if !MFMailComposeViewController.canSendMail(){
            print("cannot send mail!!")
            self.showToast(message: "Cannot send mail!!", font: .systemFont(ofSize: 12.0))
            return
        }
        sendEmail()
    }
    
    func sendEmail(){
        let composeMailVC = MFMailComposeViewController()
        composeMailVC.mailComposeDelegate = self
        
        composeMailVC.setToRecipients(["dreamskyco@gmail.com"])
        
        self.present(composeMailVC, animated: false, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    func showToast(message : String, font: UIFont) {
//
//        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
//        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
//        toastLabel.textColor = UIColor.white
//        toastLabel.font = font
//        toastLabel.textAlignment = .center;
//        toastLabel.text = message
//        toastLabel.alpha = 1.0
//        toastLabel.layer.cornerRadius = 10;
//        toastLabel.clipsToBounds  =  true
//        self.view.addSubview(toastLabel)
//        UIView.animate(withDuration: 40.0, delay: 0.1, options: .curveEaseOut, animations: {
//             toastLabel.alpha = 0.0
//        }, completion: {(isCompleted) in
//            toastLabel.removeFromSuperview()
//        })
//    }
}
