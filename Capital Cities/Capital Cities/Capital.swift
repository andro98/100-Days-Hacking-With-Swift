//
//  Capital.swift
//  Capital Cities
//
//  Created by Andrew Maher on 9/27/20.
//  Copyright © 2020 Andrew Maher. All rights reserved.
//

import MapKit
import UIKit

class Capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String){
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
}
