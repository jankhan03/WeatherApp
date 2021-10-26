//
//  NetworkManager.swift
//  WeatherByLocation
//
//  Created by Yan Khanetski on 24.10.21.
//

import Foundation
import Combine
import CoreLocation

//func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) -> Double {
//    var lat = 0.00
//    if let location = locations.last {
//        lat = location.coordinate.latitude
//        //var lon = location.coordinate.longitude
//    }
//    return lat
//}
//
//func locationManager1(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) -> Double {
//    var lon = 0.00
//    if let location = locations.last {
//        //lat = location.coordinate.latitude
//        lon = location.coordinate.longitude
//    }
//    return lon
//}

class NetworkManager {

    var lat: Double
    var lon: Double
    
    init(lat: Double, lon: Double) {
        self.lat = lat
        self.lon = lon
    }
   
    func getData(completion: @escaping (AllWeather) -> ()) {

        
        guard let url = URL(string: " https://api.openweathermap.org/data/2.5/onecall?lat=\(self.lat)&lon=\(self.lon)&exclude=minutely,alerts,daily&appid=ac806dcc9668ab8d5aadb736a041bbb3&units=metric") else { return }//
   
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            let resoult = try! JSONDecoder().decode(AllWeather.self, from: data)
            
            DispatchQueue.main.async {
                completion(resoult)
            }
        }
        .resume()
    }
}



