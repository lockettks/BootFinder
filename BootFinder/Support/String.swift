//
//  String.swift
//  BootFinder
//
//  Created by Kimberly Mathieu on 3/31/19.
//  Copyright © 2019 Kimberly Mathieu. All rights reserved.
//

import Foundation


extension String {
    
    func toCurrency() -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        
        if let priceDoubled = Double(self) {
            return currencyFormatter.string(from: NSNumber(value: priceDoubled)) ?? ""
        } else {return ""}
    }
}
