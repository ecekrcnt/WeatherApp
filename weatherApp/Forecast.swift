

import UIKit
import Alamofire

class Forecast {
    
    
    var _data: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var data: String {
        if _data == nil{
            _data = ""
        }
        return _data
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String{
        if _highTemp == nil{
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp: String{
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    init(weatherDict: Dictionary<String,AnyObject>) {
        
        if let temp = weatherDict["temp"] as? Dictionary<String,AnyObject>{
            
            if let min = temp["min"] as? Double{
                
                let celsiusTemp = Int(min - 273.15)
                self._lowTemp = "\(celsiusTemp)"
            }
            
            if let max = temp["max"] as? Double{
                
                let celsiusTemp = Int(max - 273.15)
                self._highTemp = "\(celsiusTemp)"
            }
        }
        
        if let  weather = weatherDict["weather"] as? [Dictionary<String,AnyObject>]{
            
            if let main = weather[0]["main"] as? String{
                self._weatherType = main
            }
        }
        
        if let date = weatherDict["dt"] as? Double{
            
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._data = unixConvertedDate.dayOfTheWeek()
            
        }
    }
}

extension Date {
    
    func dayOfTheWeek() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}




















