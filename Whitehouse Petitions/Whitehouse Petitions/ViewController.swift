//
//  ViewController.swift
//  Whitehouse Petitions
//
//  Created by Andrew Maher on 9/14/20.
//  Copyright © 2020 Andrew Maher. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var petitions = [Petetion]()
    var filteredPetitions = [Petetion]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPetitions()
    }
    
    @IBAction func creaditInfo(_ sender: Any) {
        let ac = UIAlertController(title: "Credits", message: "The data comes from the We The People API of the Whitehouse", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    @IBAction func searchData(_ sender: Any) {
        let ac = UIAlertController(title: "Search", message: "Enter a search query, leave it empty for all data", preferredStyle: .alert)
        ac.addTextField()
        let submitButton = UIAlertAction(title: "Search", style: .default){
            [weak self, weak ac] _ in
            guard let query = ac?.textFields?[0].text else { return }
            self?.submitSearch(query)
        }
        ac.addAction(submitButton)
        present(ac, animated: true)
    }
    
    func submitSearch(_ query: String){
        if query.isEmpty{
            filteredPetitions = petitions
            print("is Empty and filteredPetition of size \(filteredPetitions.count) against \(petitions.count)")
        }else{
            filteredPetitions = petitions.filter({ (value:Petetion) -> Bool in
                if value.title.contains(query) || value.body.contains(query){
                    return true
                }
                return false
            })
            print("Not Empty and filteredPetition of size \(filteredPetitions.count) against \(petitions.count)")
        }
        tableView.reloadData()
    }
    
    func loadPetitions(){
       let urlString = createUrlBasedOnTabTag()
        if let url = URL(string: urlString){
            if let data = try? Data(contentsOf: url){
                parse(json: data)
                return
            }
        }
        showError()
    }
    
    func createUrlBasedOnTabTag() -> String{
        return (navigationController?.tabBarItem.tag == 0) ?
         "https://hackingwithswift.com/samples/petitions-1.json" :
         "https://hackingwithswift.com/samples/petitions-2.json"
    }
    
    func parse(json: Data){
        let decoder = JSONDecoder()
        if let jsonPetetions = try? decoder.decode(Petetions.self, from: json){
            petitions = jsonPetetions.results
            filteredPetitions = petitions
            tableView.reloadData()
            return
        }
        showError()
    
    }
    
    func showError(){
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPetitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = filteredPetitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = filteredPetitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

