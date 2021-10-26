//
//  WeatherModel.swift
//  WeatherByLocation
//
//  Created by Yan Khanetski on 22.10.21.
//

import Foundation
import MapKit


struct AllWeather: Codable {
    var lat: String
    var lon: String
    var timezone: String
    var timezone_offset: String
    var current: Current
    var hourly: [Hourly]
}

struct Current: Codable {
    var dt: String?
    var sunrise: String?
    var sunset: String?
    var temp: String?
    var pressure: String?
    var humidity: String?
    var dew_point: String?
    var uvi: String?
    var clouds: String?
    var visibility: String?
    var wind_speed: String?
    var wind_gust: String?
    var weather: [Weather]
    
}

struct Weather: Codable {
    var main: String?
    var description: String?
    var icon: String?

}

struct Hourly: Codable {
    var dt: String?
    var sunrise: String?
    var sunset: String?
    var temp: String?
    var feels_like: String?
    var pressure: String?
    var humidity: String?
    var dew_point: String?
    var uvi: String?
    var clouds: String?
    var visibility: String?
    var wind_speed: String?
    var wind_gust: String?
    var weather: [Weather]
}
