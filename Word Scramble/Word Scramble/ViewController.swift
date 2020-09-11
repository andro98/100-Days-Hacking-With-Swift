//
//  ViewController.swift
//  Word Scramble
//
//  Created by Andrew Maher on 9/11/20.
//  Copyright © 2020 Andrew Maher. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var allWords = [String]()
    var usedWords = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        loadDataFromFile()
        startGame()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
    
    func loadDataFromFile(){
        if let url = Bundle.main.url(forResource: "start", withExtension: "txt"){
            //print("Founded")
            if let startWords = try? String(contentsOf: url){
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        if allWords.isEmpty{
            allWords = ["silkworm"]
        }
    }
    
    func startGame(){
        title = allWords[Int(arc4random_uniform(UInt32(allWords.count)))]
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    @objc func promptForAnswer(){
        let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default){
            [weak self, weak ac] _ in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.submit(answer)
        }
        ac.addAction(submitAction)
        present(ac, animated:true)
    }
    
    func submit(_ answer: String){
        let lowerAnswer = answer.lowercased()
        let errorTitle: String
        let errorMessage: String
        if isPossible(word: lowerAnswer){
            if isOriginal(word: lowerAnswer){
                if isReal(word: lowerAnswer){
                    usedWords.insert(lowerAnswer, at: 0)
                    
                    let indexPath = IndexPath(row:0, section: 0)
                    tableView.insertRows(at: [indexPath], with: .automatic)
                    return
                }else{
                    errorTitle = "Word not recognized"
                    errorMessage = "You can't just make them up, you Know!"
                }
            }else{
                errorTitle = "Word already used"
                errorMessage = "Be more original!"
            }
        }else{
            errorTitle = "Word not possible"
            errorMessage = "You can't spell that word from \(title!.lowercased())."
        }
        
        let ac = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default))
        present(ac, animated: true)
    }
    
    func isPossible(word: String) -> Bool{
        guard var tempWord = title?.lowercased()else{ return false }
        for letter in word{
            if let position = firstIndex(of: letter, inString: tempWord){
                tempWord.remove(at: String.Index(encodedOffset: position))
            }else{
                return false
            }
        }
        return true
    }
    
    func isOriginal(word: String) -> Bool{
        return !usedWords.contains(word)
    }
    
    func isReal(word: String) -> Bool{
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    func firstIndex(of char: Character, inString word: String) -> Int?{
        var pos = 0
        for c in word{
            if c == char{
                return pos
            }
            pos += 1
        }
        return nil
    }
}
