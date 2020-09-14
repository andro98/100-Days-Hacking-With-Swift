//
//  DetailViewController.swift
//  Whitehouse Petitions
//
//  Created by Andrew Maher on 9/14/20.
//  Copyright © 2020 Andrew Maher. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: Petetion?

    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let detailItem = detailItem else { return }
        
        let html = """
            <html>
            <head>
            <meta name="viewport" content="width=device-width, initial-scale=1">
        <style> body { font-size: 150%; margin: 10px; background-color: black; color: white; text-shadow: 1px 1px #fffff0; } </style>
            </head>
            <body>
            \(detailItem.body)
            </body>
            </html>
        """
        webView.loadHTMLString(html, baseURL: nil)
    }

}
