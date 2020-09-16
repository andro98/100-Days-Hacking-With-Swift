//
//  ViewController.swift
//  Swifty Words
//
//  Created by Andrew Maher on 9/15/20.
//  Copyright © 2020 Andrew Maher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var cluesLabel: UILabel!
    var answerLabel: UILabel!
    var currentAnswer: UITextField!
    var scoreLabel: UILabel!
    var letterButtons = [UIButton]()
    
    var activatedButtons = [UIButton]()
    var solutions = [String]()
    
    var score = 0{
        didSet{
            scoreLabel.text = "Score: \(score)"
        }
    }
    var currentGuess = 0
    var level = 1
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        // Score Label
        createScoreLabel()
        // Clues Label
        createCluesLabel()
        // Answer Label
        createAnswerLabel()
        // Current Answer
        createCurrentAnswer()
        // All Constraints
        addAllConstraints()
        // Controll Buttons
        //createControllButton()
        
    }
    
    func createScoreLabel(){
        scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.textAlignment = .right
        scoreLabel.text = "Score: 0"
        view.addSubview(scoreLabel)
    }
    
    func createCluesLabel(){
        cluesLabel = UILabel()
        cluesLabel.translatesAutoresizingMaskIntoConstraints = false
        cluesLabel.font = UIFont.systemFont(ofSize: 24)
        cluesLabel.text = "CLUES"
        cluesLabel.numberOfLines = 0
        cluesLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        view.addSubview(cluesLabel)
    }
    
    func createAnswerLabel(){
        answerLabel = UILabel()
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.font = UIFont.systemFont(ofSize: 24)
        answerLabel.text = "ANSWERS"
        answerLabel.textAlignment = .right
        answerLabel.numberOfLines = 0
        answerLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        view.addSubview(answerLabel)
    }
    
    func createCurrentAnswer(){
        currentAnswer = UITextField()
        currentAnswer.translatesAutoresizingMaskIntoConstraints = false
        currentAnswer.placeholder = "Tap letters to guess"
        currentAnswer.font = UIFont.systemFont(ofSize: 44)
        currentAnswer.textAlignment = .center
        currentAnswer.isUserInteractionEnabled = false
        view.addSubview(currentAnswer)
    }
    
    func createControllButton(){
        let submit = UIButton(type: .system)
        submit.translatesAutoresizingMaskIntoConstraints = false
        submit.setTitle("SUBMIT", for: .normal)
        view.addSubview(submit)
        
        let clear = UIButton(type: .system)
        clear.translatesAutoresizingMaskIntoConstraints = false
        clear.setTitle("CLEAR", for: .normal)
        view.addSubview(submit)
        
        
    }
    
    func addAllConstraints(){
        let submit = UIButton(type: .system)
        submit.translatesAutoresizingMaskIntoConstraints = false
        submit.setTitle("SUBMIT", for: .normal)
        submit.layer.borderWidth = 1
        submit.layer.borderColor = UIColor.gray.cgColor
        submit.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
        view.addSubview(submit)
        
        let clear = UIButton(type: .system)
        clear.translatesAutoresizingMaskIntoConstraints = false
        clear.setTitle("CLEAR", for: .normal)
        clear.layer.borderWidth = 1
        clear.layer.borderColor = UIColor.gray.cgColor
        clear.addTarget(self, action: #selector(clearTapped), for: .touchUpInside)
        view.addSubview(clear)
        
        let buttonsView = UIView()
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonsView)
        
        let width = 150
        let height = 80
        for row in 0..<4{
            for col in 0..<5{
                let letterButton = UIButton(type: .system)
                letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)
                letterButton.setTitle("WWW", for: .normal)
                letterButton.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)
                letterButton.layer.borderWidth = 1
                letterButton.layer.borderColor = UIColor.gray.cgColor
                let frame = CGRect(x: col * width, y: row * height, width: width, height: height)
                letterButton.frame = frame
                buttonsView.addSubview(letterButton)
                letterButtons.append(letterButton)
            }
        }
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            cluesLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            cluesLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 100),
            cluesLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6, constant: -100),
            answerLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            answerLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -100),
            answerLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.4, constant: -100),
            answerLabel.heightAnchor.constraint(equalTo: cluesLabel.heightAnchor),
            currentAnswer.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            currentAnswer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            currentAnswer.topAnchor.constraint(equalTo: cluesLabel.bottomAnchor, constant: 20),
            submit.topAnchor.constraint(equalTo: currentAnswer.bottomAnchor),
            submit.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            submit.heightAnchor.constraint(equalToConstant: 44),
            clear.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            clear.centerYAnchor.constraint(equalTo: submit.centerYAnchor),
            clear.heightAnchor.constraint(equalToConstant: 44),
            buttonsView.widthAnchor.constraint(equalToConstant: 750),
            buttonsView.heightAnchor.constraint(equalToConstant: 320),
            buttonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsView.topAnchor.constraint(equalTo: submit.bottomAnchor, constant: 20),
            buttonsView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20)
            ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadLevel()
    }
    
    func loadLevel(){
        var clueString = ""
        var solutionsString = ""
        var letterBits = [String]()
        
        if let levelFileUrl = Bundle.main.url(forResource: "level\(level)", withExtension: "txt"){
            if let levelContent = try? String(contentsOf: levelFileUrl){
                let lines = levelContent.components(separatedBy: "\n")
                for (index, line) in lines.enumerated(){
                    let parts = line.components(separatedBy: ": ")
                    let answer = parts[0]
                    let clue = parts[1]
                    
                    clueString += "\(index + 1). \(clue)\n"
                    let solutionWord = answer.replacingOccurrences(of: "|", with: "")
                    solutionsString += "\(solutionWord.count) letters\n"
                    solutions.append(solutionWord)
                    
                    letterBits += answer.components(separatedBy: "|")
                }
            }
        }
        cluesLabel.text = clueString.trimmingCharacters(in: .whitespacesAndNewlines)
        answerLabel.text = solutionsString.trimmingCharacters(in: .whitespacesAndNewlines)
        letterBits.shuffle()
        if letterButtons.count == letterBits.count{
            for i in 0..<letterButtons.count{
                letterButtons[i].setTitle(letterBits[i], for: .normal)
            }
        }
    }
    
    func levelUp(action: UIAlertAction){
        level += 1
        
        solutions.removeAll(keepingCapacity: true)
        loadLevel()
        
        for button in letterButtons{
            button.isHidden = false
        }
    }
    
    @objc func letterTapped(_ sender: UIButton){
        guard let buttonTitle = sender.titleLabel?.text else {return}
        currentAnswer.text = currentAnswer.text?.appending(buttonTitle)
        activatedButtons.append(sender)
        sender.isHidden = true
    }
    
    @objc func submitTapped(_ sender: UIButton){
        guard let answerText = currentAnswer.text else { return }
        
        if let solPos = solutions.firstIndex(of: answerText){
            activatedButtons.removeAll()
            
            var splitAnswers = answerLabel.text?.components(separatedBy: "\n")
            splitAnswers?[solPos] = answerText
            answerLabel.text = splitAnswers?.joined(separator: "\n")
            
            currentAnswer.text = ""
            score += 1
            currentGuess += 1
            
            if currentGuess % 7 == 0{
                showAlert(title: "Well Done!", message: "Are you ready for the next level?", buttonTitle: "Let's go!", handler: levelUp)
            }
        }else{
            score -= 1
            showAlert(title: "Wrong!", message: "Try another guess!", buttonTitle: "Try again!", handler: clearAnswer)
        }
    }
    
    func showAlert(title: String, message: String, buttonTitle: String, handler: @escaping (UIAlertAction) -> Void){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: handler))
        present(ac, animated: true)
    }
    
    @objc func clearTapped(_ sender: UIButton){
     clearAnswer()
    }
    
    func clearAnswer(action: UIAlertAction? = nil){
        currentAnswer.text = ""
        for button in activatedButtons{
            button.isHidden = false
        }
        activatedButtons.removeAll()
    }
}

extension Array where Element == String{
    func firstIndex(of value: String) -> Int?{
        for i in 0..<self.count{
            if self[i] == value{
                return i
            }
        }
        return nil
    }
}

extension Array{
    mutating func shuffle(){
        if count < 2 { return  }
        for i in 0..<(self.count - 1) {
            let j = Int(arc4random_uniform(UInt32(self.count - i))) + i
            self.swapAt(i, j)
        }
    }
}
