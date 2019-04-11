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
    
//    let imageView = UIImageView(frame: frame)
//    let url = URL(string: "https://httpbin.org/image/png")!
//    let placeholderImage = UIImage(named: "placeholder")!
    
   
    
    
    @IBAction func buyPressed(_ sender: Any) {
    }
    @IBAction func favoriteBtnTouched(_ sender: Any) {
        isFavorited = !isFavorited
        setFavoriteIconImg()
//        favoriteBtn.imageView = isFavorited ? favoriteBtn.setImage(emptyStar, for: .normal) : favoriteBtn.setImage(emptyStar, for: .normal)
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
//        price.text = bootResult.price
        
//        previewImage.image = UIImage(named: "boot-placeholder.jpg")
        if let url = URL(string: bootResult.imageURL) {
//            previewImage.load(url: url)
            
            previewImage.af_setImage(withURL: url, placeholderImage: self.placeholderImage)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}


//extension UIImageView {
//    func load(url: URL) {
//        DispatchQueue.global().async { [weak self] in
//            if let data = try? Data(contentsOf: url) {
//                if let image = UIImage(data: data) {
//                    DispatchQueue.main.async {
//                        self?.image = image
//                    }
//                }
//            }
//        }
//    }
//}
