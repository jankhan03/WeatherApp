//
//  WeatherModel.swift
//  WeatherByLocation
//
//  Created by Yan Khanetski on 22.10.21.
//

import Foundation
import MapKit


struct AllWeather: Codable {
    
    var current: Current?
    var hourly: [Hourly]?
}

struct Current: Codable {
    var dt: Date?
    var temp: Double?
    var pressure: Double?
    var humidity: Double?
    var wind_speed: Double?
    var wind_gust: Double?
    var weather: [Weather]?
    
}

struct Weather: Codable {
    var main: String?
    var description: String?
    var icon: String?

}

struct Hourly: Codable {
    var dt: Date?
    var temp: Double?
    var pressure: Double?
    var humidity: Double?
    var wind_speed: Double?
    var wind_gust: Double?
    var weather: [Weather]?
}
