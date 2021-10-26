//
//  ViewController.swift
//  WeatherByLocation
//
//  Created by Yan Khanetski on 21.10.21.
//

import UIKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager:CLLocationManager?
    var currentLocation:CLLocation?
    
    private var latlngLabel:UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemFill
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    var weather: AllWeather?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //передаем инфу
        
        
        NetworkManager().getData { dataFromApi in
            self.weather = dataFromApi
        } // создал инстанс
       

        
        print(self.weather?.current.temp)
        
        // location
        
        latlngLabel.frame = CGRect(x: 30, y: view.bounds.height / 2 - 40, width: view.bounds.width - 40, height: 200)
        view.addSubview(latlngLabel)
        
        locationManager = CLLocationManager()
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
        
        locationManager?.delegate = self
        locationManager?.allowsBackgroundLocationUpdates = true
        
        // parsing
        
        //NetworkManager.getData(timezone)
        
      //  getData
        NetworkManager().getData { (dataFromApi) in
            print(dataFromApi.timezone)
            print(dataFromApi.hourly)
        }

    }
    
    
    // location
    

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
        guard let currentLocation = currentLocation else {
            return
        }

        let lon = currentLocation.coordinate.longitude
        let lat = currentLocation.coordinate.latitude
        
        print("\(lon) | \(lat)")
    }

    @IBAction func shareButton(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: ["pret"], applicationActivities: nil)
        
        activityVC.popoverPresentationController?.sourceView = self.view
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
    
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.last {
//            latLngLabel.text = "Lat : \(location.coordinate.latitude) \nLng : \(location.coordinate.longitude)"
//        }
//    }

}

class ForecastViewController: UIViewController, CLLocationManagerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}
