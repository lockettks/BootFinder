//
//  ResultsViewController.swift
//  ImageClassification
//
//  Created by Kimberly Mathieu on 3/3/19.
//  Copyright © 2019 Skafos. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet var bootImageView: UIImageView!
    @IBOutlet var resultsTable: UITableView!
    
    var rawResults : ArraySlice<(offset: Int, element: Double)>?
    var bootResults = [BootResult]()
    var bootImage = UIImage(named: "boot-placeholder.jpg")
    var selectedBoot: BootResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsTable.dataSource = self
        resultsTable.delegate = self
        
        
        let nib = UINib(nibName: "ResultCell", bundle: nil)
        
        resultsTable.register(nib, forCellReuseIdentifier: "cell")
        bootImageView.image = bootImage
        
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let selectedBoot = selectedBoot {
            if segue.identifier == "detailsSegue" {
                if let vc = segue.destination as? DetailsViewController {
                    vc.configureWithModel(selectedBoot: selectedBoot)
                }
            }
        }
    }
    
    
}

extension ResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = resultsTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ResultTableViewCell {
            cell.configureWithItem(bootResult: bootResults[indexPath.row])
            print("boot description: \(bootResults[indexPath.row].description)\n")
            print(" price: \(bootResults[indexPath.row].price)\n")
            print(" url: \(bootResults[indexPath.row].url)\n")
            
            return cell
        }
        return UITableViewCell()
    }
    
    
}

extension ResultsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailsSegue", sender: self)
    }
    
}
