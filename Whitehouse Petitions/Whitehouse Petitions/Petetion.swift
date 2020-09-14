//
//  Petetion.swift
//  Whitehouse Petitions
//
//  Created by Andrew Maher on 9/14/20.
//  Copyright © 2020 Andrew Maher. All rights reserved.
//

import Foundation

struct Petetion: Codable{
    var title: String
    var body: String
    var signatureCount:Int
}
