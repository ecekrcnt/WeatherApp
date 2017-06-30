

import CoreLocation

class Location {
    
    static var shareInstance = Location()
    
    private init(){}
    
    var latitude: Double!
    var longitude: Double!
}
