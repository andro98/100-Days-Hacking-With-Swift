//
//  Person.swift
//  Names To Faces
//
//  Created by Andrew Maher on 9/18/20.
//  Copyright © 2020 Andrew Maher. All rights reserved.
//

import Foundation

class Person: NSObject, Codable{
  
    var name: String
    var image: String
    
    init(name: String, image: String){
        self.name = name
        self.image = image
    }
    
    /*func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(image, forKey: "image")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
        image = aDecoder.decodeObject(forKey: "image") as? String ?? ""
    }*/
    
}
