//
//  ViewController.swift
//  WeatherByLocation
//
//  Created by Yan Khanetski on 21.10.21.
//

import UIKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager: CLLocationManager?
    var currentLocation: CLLocation?
    var weather: AllWeather?
    var networkManager: NetworkManager?
    
    private var latlngLabel:UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemFill
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLocation()
        self.requestWeatherForLocation()
        self.weather = AllWeather()
        
        NetworkManager(lat: 1.1, lon: 1.1).getData { dataFromApi in
            self.weather = dataFromApi
        }
        
        print(self.weather?.current?.temp ?? "ХУЙ")
            
        latlngLabel.frame = CGRect(x: 30, y: view.bounds.height / 2 - 40, width: view.bounds.width - 40, height: 200)
        view.addSubview(latlngLabel)
        
        locationManager = CLLocationManager()
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
        
        locationManager?.delegate = self
        locationManager?.allowsBackgroundLocationUpdates = true
    }
    

    func setupLocation() {
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
        if !locations.isEmpty, currentLocation == nil {
            currentLocation = locations.first
            locationManager?.stopUpdatingLocation()
            requestWeatherForLocation()
        }
        
    }
        
    func requestWeatherForLocation() {
        
        var lat = currentLocation?.coordinate.latitude
        var lon = currentLocation?.coordinate.longitude

        self.networkManager = NetworkManager(lat: currentLocation?.coordinate.latitude ?? 0.0, lon: currentLocation?.coordinate.longitude ?? 0.0)
        
    }

    @IBAction func shareButton(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: ["pret"], applicationActivities: nil)
        
        activityVC.popoverPresentationController?.sourceView = self.view
        
        self.present(activityVC, animated: true, completion: nil)
    }

}

class ForecastViewController: UIViewController, CLLocationManagerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
