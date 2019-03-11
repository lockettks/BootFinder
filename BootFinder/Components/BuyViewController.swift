//
//  BuyViewController.swift
//  ImageClassification
//
//  Created by Kimberly Mathieu on 3/3/19.
//  Copyright © 2019 Skafos. All rights reserved.
//

import UIKit
import WebKit

class BuyViewController: UIViewController {

    @IBOutlet var BuyWebView: WKWebView!
    
    let webView = WKWebView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL (string: "url here")
        let requestObj = URLRequest(url: url!)
        webView.load(requestObj)

        // Do any additional setup after loading the view.
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
