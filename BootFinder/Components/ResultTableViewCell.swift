//
//  ResultTableViewCell.swift
//  ImageClassification
//
//  Created by Kimberly Mathieu on 3/3/19.
//  Copyright © 2019 Skafos. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ResultTableViewCell: UITableViewCell {

    @IBOutlet var previewImage: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet var favoriteBtn: UIButton!
    var emptyStar = UIImage(named: "star-empty.png")
    var filledStar = UIImage(named: "star-yellow.png")
    let placeholderImage = UIImage(named: "boot-placeholder.jpg")
    var isFavorited = false
    
    @IBAction func buyPressed(_ sender: Any) {
    }
    @IBAction func favoriteBtnTouched(_ sender: Any) {
        isFavorited = !isFavorited
        setFavoriteIconImg()
    }
    
    func setFavoriteIconImg(){
        favoriteBtn.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        if (isFavorited) {
            favoriteBtn.setImage(filledStar, for: .normal)
        } else {
            favoriteBtn.setImage(emptyStar, for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureWithItem(bootResult: BootResult) {
        title.text = bootResult.description
        price.text = bootResult.price.toCurrency()
        if let url = URL(string: bootResult.imageURL) {
            previewImage.af_setImage(withURL: url, placeholderImage: self.placeholderImage)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
