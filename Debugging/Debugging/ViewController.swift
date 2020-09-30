//
//  ViewController.swift
//  Debugging
//
//  Created by Andrew Maher on 9/28/20.
//  Copyright © 2020 Andrew Maher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("I'm inside the viewDidLoad() method.")
        
        assert(1 == 1, "Math failure!")
        assert(1 == 2, "Math failure!")
        
        for i in 1...100{
            print("Got number \(i).")
        }

    }

}

