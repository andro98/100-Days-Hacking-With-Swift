//
//  ActionViewController.swift
//  Extension
//
//  Created by Andrew Maher on 9/30/20.
//  Copyright © 2020 Andrew Maher. All rights reserved.
//

import UIKit
import MobileCoreServices

class ActionViewController: UIViewController {

    @IBOutlet var script: UITextView!
    
    var pageTitle = ""
    var pageUrl = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        
//        let notifyCenter = NotificationCenter.default
//        notifyCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
//        notifyCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    
        if let inputItem = extensionContext?.inputItems.first as? NSExtensionItem{
            if let itemProvider = inputItem.attachments?.first as? NSItemProvider{
                itemProvider.loadItem(forTypeIdentifier: kUTTypePropertyList as String){
                    [weak self] (dict, err) in
                    guard let itemDict = dict as? NSDictionary else {return}
                    guard let javaScriptValues = itemDict[NSExtensionJavaScriptPreprocessingResultsKey] as? NSDictionary else {return}
                    self?.pageTitle = javaScriptValues["title"] as? String ?? ""
                    self?.pageUrl = javaScriptValues["URL"] as? String ?? ""
                    
                    DispatchQueue.main.async{
                        self?.title = self?.pageTitle
                    }
                }
            }
        }
    }

    @IBAction func done() {
        let item = NSExtensionItem()
        let args: NSDictionary = ["customJavaScript": script.text]
        let webDict: NSDictionary = [NSExtensionJavaScriptFinalizeArgumentKey: args]
        let customJS = NSItemProvider(item: webDict, typeIdentifier: kUTTypePropertyList as String)
        item.attachments = [customJS]
        extensionContext?.completeRequest(returningItems: [item])
    }

    @objc func adjustForKeyboard(notify: Notification){
        
        
    }
}
