//
//  CurrentWeatherModel.swift
//  weatherApp
//
//  Created by EceKaracantaon 6.06.2017.
//  Copyright © 2017 EceKaracanta All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeatherModel {
    
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Int!
    
    var cityName: String{
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String{
        if _date == nil{
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    var weatherType: String{
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Int{
        if _currentTemp == nil{
            _currentTemp = 0
        }
        return _currentTemp
    }
    
    func downloadWeatherDeatils(complated: @escaping DownloadComplate){
        
        // Alamofire download 
        
        
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
            
            let result = response.result
            
            if let dic = result.value as? Dictionary<String,AnyObject> {
                
                if let name = dic["name"] as? String{
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                
                if let weather = dic["weather"] as? [Dictionary<String,AnyObject>]{
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                
                if let main = dic["main"] as? Dictionary<String,AnyObject> {
                    if let kelvinTemp = main["temp"] as? Double{
                        let celsiusTemp = Int(kelvinTemp - 273.15)
                        
                        self._currentTemp = celsiusTemp
                        print(self._currentTemp)
                    }
                }
                
            }
            complated()
        }
        
    }
}
























