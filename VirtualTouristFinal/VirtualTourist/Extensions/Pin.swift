//
//  Flag.swift
//  VirtualTourist
//
//  Created by Ahmad on 25/07/2019.
//  Copyright © 2019 ahmad. All rights reserved.
//

import MapKit
import Foundation

extension Pin{
    var cord : CLLocationCoordinate2D {
        
        set {
            lat = newValue.latitude
            lon = newValue.longitude
        }
        
        get { return CLLocationCoordinate2D(latitude: lat, longitude: lon)
            
        }
    }
    
    func comparison(to cordinate: CLLocationCoordinate2D) -> Bool {
        return (lat == cordinate.latitude && lon == cordinate.longitude)
    }
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        createdDate = Date()
        
    }
}
