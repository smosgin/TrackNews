//
//  NewsItemViewController.swift
//  TrackNews
//
//  Created by Seth Mosgin on 10/9/18.
//  Copyright © 2018 Seth Mosgin. All rights reserved.
//

import UIKit
import WebKit

class NewsItemViewController: UIViewController, WKNavigationDelegate {
    
    var urlString: String?
    let webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(urlString ?? "url is nil")
        
        if let urlString = urlString {
            guard let url = URL(string: urlString) else { return }
            view.addSubview(webView)
            webView.frame = view.bounds
            webView.navigationDelegate = self
            webView.load(URLRequest(url: url))
            webView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        }
    }
    
//    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
//        // Open URL locally
//        decisionHandler(.allow)
//    }

}
