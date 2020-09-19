//
//  Person.swift
//  Names To Faces
//
//  Created by Andrew Maher on 9/18/20.
//  Copyright © 2020 Andrew Maher. All rights reserved.
//

import Foundation

class Person: NSObject{
    var name: String
    var image: String
    
    init(name: String, image: String){
        self.name = name
        self.image = image
    }
}
