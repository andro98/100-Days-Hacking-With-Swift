//
//  ViewController.swift
//  Easy Browser
//
//  Created by Andrew Maher on 9/10/20.
//  Copyright © 2020 Andrew Maher. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    var progress: UIProgressView!
    var websites = ["google.com", "apple.com"]
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        
        progress = UIProgressView(progressViewStyle: .default)
        progress.sizeToFit()
        let progressButton = UIBarButtonItem(customView: progress)
        
        toolbarItems = [progressButton, spacer, refresh]
        navigationController?.isToolbarHidden = false
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        let url = URL(string: "https://" + websites[0])
        webView.load(URLRequest(url: url!))
        print("Loading...")
        webView.allowsBackForwardNavigationGestures = true
    }
    
    @objc func openTapped(){
        let ac = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)
        for website in websites{
            ac.addAction(UIAlertAction(title: website, style: .default, handler: openPage))
        }
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
        print("Loaded...")
    }
    
    /*func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.url
        var isContaine: Bool = false
        
        if let host = url?.host{
            for site in websites{
                print("\(site): \(host)")
                if site.contains(host){
                    print("true contains")
                    decisionHandler(.allow)
                    isContaine = true
                    break
                }
            }
        }
        
        if !isContaine{
            print("Canceld")
            decisionHandler(.cancel)
        }
    }*/
    
    func openPage(action: UIAlertAction){
        let url = URL(string:"https://" + action.title!)!
        webView.load(URLRequest(url: url))
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress"{
            progress.progress = Float(webView.estimatedProgress)
        }
    }
}
