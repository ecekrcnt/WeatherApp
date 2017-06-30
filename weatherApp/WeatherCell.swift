//
//  WeatherCell.swift
//  weatherApp
//
//  Created by EceKaracanta on 8.06.2017.
//  Copyright © 2017 EceKaracanta. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var img_weatherIcon: UIImageView!
    @IBOutlet weak var lbl_day: UILabel!
    @IBOutlet weak var lbl_weather_type: UILabel!
    @IBOutlet weak var lbl_highTemp: UILabel!
    @IBOutlet weak var lbl_lowTemp: UILabel!
    
    func  configureCell(forecast: Forecast){
        lbl_lowTemp.text = "\(forecast.lowTemp)°"
        lbl_highTemp.text = "\(forecast.highTemp)°"
        lbl_weather_type.text = forecast.weatherType
        lbl_day.text = forecast.data
        img_weatherIcon.image = UIImage(named: forecast.weatherType)
    }
 

}
