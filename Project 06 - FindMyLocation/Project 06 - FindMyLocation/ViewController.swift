//
//  ViewController.swift
//  Project 06 - FindMyLocation
//
//  Created by 张庆杰 on 16/3/29.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var positionLabel: UILabel!
    
    var locationManager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func positingingAction(sender: UIButton) {
        // 初始化
        locationManager = CLLocationManager()
        locationManager.delegate = self
        // 定位精度
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    // MARK: - CLLocationManagerDelegate

    // 处理定位失败
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        positionLabel.text = "Error while update location: " + error.localizedDescription
    }
    
    // 处理定位成功，manager参数表示位置管理器实例；locations为一个数组，是位置变化的集合，它按照时间变化的顺序存放。
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!) { (placemarks, error) -> Void in
            if error != nil {
                self.positionLabel.text = "ReverseGeocodeLocation Error: " + (error?.localizedDescription)!
            }
            if placemarks?.count > 0 {
                self.displayLocation(placemarks![0])
            } else {
                self.positionLabel.text = "Placemarks Data Error: " + (error?.localizedDescription)!
            }
        }
    }
    
    // MARK: - Private Methods
    
    func displayLocation(placemark: CLPlacemark?) {
        if let containsPlacemark = placemark {
            // 国家
            let country = containsPlacemark.country != nil ? containsPlacemark.country : ""
            // 城市
            let locality = containsPlacemark.locality != nil ? containsPlacemark.locality : ""
            // 街道
            let thoroughfare = containsPlacemark.thoroughfare != nil ? containsPlacemark.thoroughfare : ""
            self.positionLabel.text = country! + " " + locality! + " " + thoroughfare!
            self.locationManager.stopUpdatingLocation()
        }
    }
}

