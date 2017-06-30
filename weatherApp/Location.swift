//
//  Location.swift
//  weatherApp
//
//  Created by EceKaracanta on 9.06.2017.
//  Copyright © 2017 EceKaracanta. All rights reserved.
//

import CoreLocation

class Location {
    
    static var shareInstance = Location()
    
    private init(){}
    
    var latitude: Double!
    var longitude: Double!
}
