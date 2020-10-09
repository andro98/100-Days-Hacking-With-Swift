//
//  ViewController.swift
//  Meme Generator
//
//  Created by Andrew Maher on 10/9/20.
//  Copyright © 2020 Andrew Maher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var choosenImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    @IBAction func addTextTapped(_ sender: Any) {
        let ac = UIAlertController(title: "Add Text To Image", message: nil, preferredStyle: .alert)
        ac.addTextField()
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "Ok!", style: .default){
            [weak self, weak ac] _ in
            let topText = ac?.textFields?[0].text
            let bottomTxt = ac?.textFields?[1].text
            self?.createMeme(topT: topText, topB: bottomTxt)
        })
        present(ac, animated: true)
    }
    
    func createMeme(topT: String?, topB: String?){
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        let image = renderer.image{ ctx in
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let attrs: [NSAttributedStringKey: Any] = [
                .font: UIFont.systemFont(ofSize: 32, weight: .bold),
                .paragraphStyle: paragraphStyle,
                .foregroundColor: UIColor.white]
            
            if let choosenImage = choosenImage{
                choosenImage.draw(in: CGRect(x: 0, y: 10, width: view.frame.width - 20, height: view.frame.height - 150))
            }
            
            if let topString = topT{
                let attributedString = NSAttributedString(string: topString, attributes: attrs)
                attributedString.draw(with: CGRect(x: 0, y: 15, width: view.frame.width, height: 40), options: .usesLineFragmentOrigin, context: nil)
            }
            
           
            
            if let bottomString = topB{
                let attributedString = NSAttributedString(string: bottomString, attributes: attrs)
                attributedString.draw(with: CGRect(x: 0, y: view.frame.height - 190, width: view.frame.width, height: 40), options: .usesLineFragmentOrigin, context: nil)
            }
        }
        
        imageView.image = image
        imageView.sizeToFit()
    }
    
    @IBAction func shareImage(_ sender: Any) {
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info["UIImagePickerControllerEditedImage"] as? UIImage else {return}
        dismiss(animated: true)
        choosenImage = image
    }
}
