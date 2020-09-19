//
//  ViewController.swift
//  Names To Faces
//
//  Created by Andrew Maher on 9/18/20.
//  Copyright © 2020 Andrew Maher. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    var people = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPerson))
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Person", for: indexPath) as? PersonCell else{ fatalError("Unable to deque a PersonCell") }
        cell.person = people[indexPath.item]
        cell.layer.cornerRadius = 7
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let person = people[indexPath.item]
        let ac_choose = UIAlertController(title: "What do you want!", message: nil, preferredStyle: .alert)
        ac_choose.addAction(UIAlertAction(title: "Delete", style: .destructive){
            [weak self, weak ac_choose] _ in
            self?.people.remove(at: indexPath.item)
            self?.collectionView?.reloadData()
        })
        ac_choose.addAction(UIAlertAction(title: "Rename", style: .default){
            [weak self, weak ac_choose] _ in
            let ac  = UIAlertController(title: "Rename person", message: nil, preferredStyle: .alert)
            ac.addTextField()
            ac.addAction(UIAlertAction(title: "OK", style: .default){
                [weak self, weak ac] _ in
                guard let newName = ac?.textFields?[0].text else { return }
                person.name = newName
                self?.collectionView?.reloadData()
            })
            ac.addAction(UIAlertAction(title: "Cancle", style: .cancel))
            self?.present(ac, animated: true)
        })
        present(ac_choose, animated: true)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    @objc func addNewPerson(){
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info["UIImagePickerControllerEditedImage"] as? UIImage else { return }
        
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        if let jpegData = UIImageJPEGRepresentation(image, 0.8){
            try? jpegData.write(to: imagePath)
        }
        print(imageName)
        print(imagePath)
        let p = Person(name: "Unkown", image: imagePath.path)
        people.append(p)
        collectionView?.reloadData()
        dismiss(animated: true)
    }
    
    func getDocumentsDirectory() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
