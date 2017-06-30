

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGİTUDE = "&lon="
let APP_IDE = "&appid="
let API_KEY = "f067cd16326de083146b42002effa017"

typealias DownloadComplate = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(Location.shareInstance.latitude!)\(LONGİTUDE)\(Location.shareInstance.longitude!)\(APP_IDE)\(API_KEY)"


let Forecast_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.shareInstance.latitude!)&lon=\(Location.shareInstance.longitude!)&cnt=10&appid=f067cd16326de083146b42002effa017"
