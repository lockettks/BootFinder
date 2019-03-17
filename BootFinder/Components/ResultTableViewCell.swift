//
//  ResultTableViewCell.swift
//  ImageClassification
//
//  Created by Kimberly Mathieu on 3/3/19.
//  Copyright © 2019 Skafos. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    @IBOutlet var previewImage: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var price: UILabel!
    
    @IBAction func buyPressed(_ sender: Any) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureWithItem(bootResult: BootResult) {
        title.text = bootResult.description
        price.text = bootResult.price
        previewImage.image = UIImage(named: "boot-placeholder.jpg")
        if let url = URL(string: bootResult.imageURL) {
            previewImage.load(url: url)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
