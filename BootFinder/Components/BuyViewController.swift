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
    @IBOutlet var webViewPlaceholder: UIView!
    
    var webView: WKWebView?
    var url = URL(string: "http://ioscreator.com")!
    
    func configureWithModel(bootUrl: URL) {
        self.url = bootUrl
    }
    
    
    //    var webView: WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // init webView
        webView = WKWebView(frame: view.bounds)
        webView?.navigationDelegate = self
//        view.addSubview(webView!)
        webViewPlaceholder.addSubview(webView!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // load url
        webView?.load(URLRequest(url: url))
        
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView?.reload))
        toolbarItems = [refresh]
        navigationController?.isToolbarHidden = false
    }
    
    
    
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //
    //        // 1
    //
    //        webView.load(URLRequest(url: url))
    //
    //        // 2
    //        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
    //        toolbarItems = [refresh]
    //        navigationController?.isToolbarHidden = false
    //    }
    //
    //    override func loadView() {
    //        webView = WKWebView()
    //        webView.navigationDelegate = self
    //        view = webView
    //    }
    //
    //    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    //        title = webView.title
    //    }
    
    
    @IBAction func closeButtonTouched(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
