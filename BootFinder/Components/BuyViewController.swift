//
//  BuyViewController.swift
//  ImageClassification
//
//  Created by Kimberly Mathieu on 3/3/19.
//  Copyright © 2019 Skafos. All rights reserved.
//

import UIKit
import WebKit

class BuyViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var buyWebView: WKWebView!
    
    var webView: WKWebView!
    var url = URL(string: "http://ioscreator.com")!
    
    func configureWithModel(bootUrl: URL) {
        self.url = bootUrl
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1
        
        webView.load(URLRequest(url: url))
        
        // 2
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        toolbarItems = [refresh]
        navigationController?.isToolbarHidden = false
    }
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
