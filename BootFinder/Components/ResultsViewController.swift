//
//  ResultsViewController.swift
//  ImageClassification
//
//  Created by Kimberly Mathieu on 3/3/19.
//  Copyright © 2019 Skafos. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet var sampleBoot: UIImageView!
    @IBOutlet var resultsTable: UITableView!
    
    var rawResults : ArraySlice<(offset: Int, element: Double)>?
    var bootResults = [BootResult]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsTable.dataSource = self
        resultsTable.delegate = self
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

extension ResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = resultsTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ResultTableViewCell {
            cell.configureWithItem(bootResult: bootResults[indexPath.row])
            
            return cell
        }
        return UITableViewCell()
    }
    
    
}

extension ResultsViewController: UITableViewDelegate {
    
}
