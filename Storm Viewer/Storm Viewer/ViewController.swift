//
//  ViewController.swift
//  Storm Viewer
//
//  Created by Andrew Maher on 9/5/20.
//  Copyright © 2020 Andrew Maher. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    
    func loadImages() -> Void{
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        print(items)
        for item in items{
            if item.hasPrefix("nssl"){
                pictures.append(item)
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        pictures.append("nssl0033.jpg")
        pictures.append("nssl0034.jpg")
        pictures.append("nssl0041.jpg")
        pictures.append("nssl0042.jpg")
        pictures.append("nssl0043.jpg")
        pictures.append("nssl0045.jpg")
        pictures.append("nssl0046.jpg")
        pictures.append("nssl0049.jpg")


        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadImages()
        print(pictures)
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailsViewController{
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

