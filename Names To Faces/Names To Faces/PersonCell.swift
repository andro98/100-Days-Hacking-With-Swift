//
//  PersonCell.swift
//  Names To Faces
//
//  Created by Andrew Maher on 9/18/20.
//  Copyright © 2020 Andrew Maher. All rights reserved.
//

import UIKit

class PersonCell: UICollectionViewCell {
    @IBOutlet var personImage: UIImageView!
    @IBOutlet var personName: UILabel!
    
    var person: Person?{
        didSet{
            self.personName.text = person?.name
            self.personImage.image = UIImage(contentsOfFile: (person?.image)!)
            self.personImage.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
            self.personImage.layer.borderWidth = 2
            self.personImage.layer.cornerRadius = 3
        }
    }
    
    
}
