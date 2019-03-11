//
//  ViewController.swift
//  ImageClassification
//
//  Created by Kevin Musselman on 1/10/19.
//  Copyright © 2018 Skafos. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {

  lazy var label:UILabel = {
    let label           = UILabel()
    label.text          = "Boot Finder"
    label.font          = label.font.withSize(40)
    label.textAlignment = .center

    self.view.addSubview(label)

    return label
  }()

  lazy var about:UILabel = {
    let label           = UILabel()
    label.text          = "BootFinder is a camera based search app. ADD MORE INFO?"
    label.textAlignment = .center
    label.lineBreakMode = .byWordWrapping
    label.numberOfLines = 5

    self.view.addSubview(label)

    return label
  }()
  
  lazy var photoButton:UIButton = {
    let button        = UIButton(type: .custom)
//    button.backgroundColor = .white

    button.setTitle("Choose from your photo library", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.setTitleColor(.gray, for: .highlighted)
    button.titleLabel?.textAlignment = .left
    button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
    if let image = UIImage(named: "imageGalleryIcon.png")?.imageWithSize(scaledToSize: CGSize(width: 100, height: 100)).withRenderingMode(.alwaysTemplate) {
      button.setImage(image, for: .normal)
    }
    button.imageView?.tintColor = .black
    button.tintColor = UIColor.blue
    button.layer.borderWidth = 2.0
    button.layer.borderColor = UIColor.black.cgColor


    button.contentHorizontalAlignment = .left
    button.imageEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    button.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 0.0)

    self.view.addSubview(button)
    return button
  }()

  lazy var cameraButton:UIButton = {
    let button        = UIButton(type: .custom)
    let img = UIImage(named: "Rectangle.png")
//    button.setImage(img , for: .normal)
    
//    button.backgroundColor = .white

    button.setTitle("Use your camera", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.setTitleColor(.gray, for: .highlighted)
    button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
    button.titleLabel?.textAlignment = .left
    if let image = UIImage(named: "camera-icon.png")?.imageWithSize(scaledToSize: CGSize(width: 100, height: 100)).withRenderingMode(.alwaysTemplate) {
      button.setImage(image, for: .normal)
    }

    button.contentHorizontalAlignment = .left
    button.imageEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    button.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 0.0)

    button.imageView?.tintColor = .black
    button.tintColor = UIColor.blue
    button.layer.borderWidth = 2.0
    button.layer.borderColor = UIColor.black.cgColor

    self.view.addSubview(button)
    
    return button
  }()
    
    

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()

    label.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(60)
      make.right.left.equalToSuperview()
      make.height.equalTo(60)
    }
    about.snp.makeConstraints { (make) in
      make.top.equalTo(label.snp.bottom).offset(10)
      make.right.left.equalToSuperview().inset(10)
      make.height.equalTo(120)
    }

    photoButton.snp.makeConstraints { (make) in
      make.top.equalTo(about.snp.bottom).offset(50)
      make.right.left.equalToSuperview().inset(10)
      make.height.equalTo(100)
    }

    cameraButton.snp.makeConstraints { (make) in
      make.top.equalTo(photoButton.snp.bottom).offset(10)
      make.right.left.equalToSuperview().inset(10)
      make.height.equalTo(100)
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg pattern.png")!)
//    self.view.backgroundColor = .white

    let layer = UIView(frame: CGRect(x: 3, y: 0, width: 411, height: 736))
    self.view.addSubview(layer)
  }
}
