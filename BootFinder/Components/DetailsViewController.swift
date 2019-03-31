//
//  DetailsViewController.swift
//  ImageClassification
//
//  Created by Kimberly Mathieu on 3/3/19.
//  Copyright © 2019 Skafos. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var bootImageView: UIImageView!
    @IBOutlet var bootPriceLabel: UILabel!
    @IBOutlet var bootDescriptionLabel: UILabel!
    
    var bootImage = UIImage()
    var bootDescription = ""
    var bootPrice = ""
    var bootUrl = ""
    
    private var selectedBoot = BootResult()
    
    override func viewWillAppear(_ animated: Bool) {
        if let url = URL(string: selectedBoot.imageURL) {
            bootImageView.load(url: url)
        }
        
        //        let currencyFormatter = NumberFormatter()
        //        currencyFormatter.usesGroupingSeparator = true
        //        currencyFormatter.numberStyle = .currency
        //        // localize to your grouping and decimal separator
        //        currencyFormatter.locale = Locale.current
        //
        //        if let priceDoubled = Double(selectedBoot.price) {
        //            let priceFormatted = currencyFormatter.string(from: NSNumber(value: priceDoubled))
        
        //            bootPriceLabel.text = priceFormatted
        bootPriceLabel.text = selectedBoot.price.toCurrency()
        bootDescriptionLabel.text = selectedBoot.description
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bootImageView.image = UIImage(named: "boot-placeholder.jpg")
    }
    
    func configureWithModel(selectedBoot: BootResult) {
        self.selectedBoot = selectedBoot
    }
    
    @IBAction func buyButtonTouched(_ sender: Any) {
        print("provide safari view to \(bootUrl)")
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
