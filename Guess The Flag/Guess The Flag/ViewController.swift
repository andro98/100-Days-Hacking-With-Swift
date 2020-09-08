//
//  ViewController.swift
//  Guess The Flag
//
//  Created by Andrew Maher on 9/8/20.
//  Copyright © 2020 Andrew Maher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!

    @IBOutlet var roundLabel: UILabel!
    var firstLabel: UILabel!
    var secondLabel: UILabel!
    
    let totalRounds = 5
    var countries = Array<String>()
    var score = 0
    var correctAnswer = 0
    var currentQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createLabelsInNavigationBar()
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        buttonCLayersDraw()
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil){
        currentQuestion += 1
        shuffle()
        correctAnswer = Int(arc4random_uniform(2))
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    
        updatelabelBar()
    }
    
    func shuffle(){
        var last = countries.count - 1
        
        while(last > 0)
        {
            let rand = Int(arc4random_uniform(UInt32(last)))
            countries.swapAt(last, rand)
            last -= 1
        }
    }
    
    func buttonCLayersDraw(){
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func newGame(action: UIAlertAction!){
        score = 0
        currentQuestion = 0
        askQuestion()
    }
    
    // Connected to the 3 buttons
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String
        if currentQuestion == totalRounds{
            title = "End Game"
            message = "Your final score is \(score)"
        }else if sender.tag == correctAnswer{
            title = "Correct"
            score += 10
            message = "Your score is \(score)"
        }else{
            title = "Wrong"
            score -= 10
            message = "Wrong! That's the flag of \(countries[sender.tag].uppercased())"
        }
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(
            UIAlertAction(
            title: (currentQuestion == totalRounds) ? "New Game" : "Continue",
            style: .default,
            handler: (currentQuestion == totalRounds) ? newGame : askQuestion )
        )
        present(ac, animated: true)
    }
    
    func createLabelsInNavigationBar(){
        if let navigationBar = self.navigationController?.navigationBar {
            let firstFrame = CGRect(x: 0, y: 0, width: navigationBar.frame.width/2, height: navigationBar.frame.height)
            let secondFrame = CGRect(x: navigationBar.frame.width/2, y: 0, width: navigationBar.frame.width/2, height: navigationBar.frame.height)
            
            firstLabel = UILabel(frame: firstFrame)
            secondLabel = UILabel(frame: secondFrame)
            
            navigationBar.addSubview(firstLabel)
            navigationBar.addSubview(secondLabel)
        }
    }
    
    func updatelabelBar(){
        firstLabel.text = countries[correctAnswer].uppercased()
        secondLabel.text = "Score: \(score)"
        roundLabel.text = "\(currentQuestion) / \(totalRounds)"
    }
}
