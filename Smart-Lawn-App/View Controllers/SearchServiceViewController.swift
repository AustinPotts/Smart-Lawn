//
//  SearchServiceViewController.swift
//  Smart-Lawn-App
//
//  Created by Austin Potts on 10/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SearchServiceViewController: UIViewController {

    @IBOutlet weak var serviceImage: UIImageView!
    @IBOutlet weak var serviceLabel: UILabel!
    @IBOutlet weak var serviceTimeDuration: UILabel!
    @IBOutlet weak var servicePrice: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addServiceToCartButton(_ sender: Any) {
    }
    
    
    
    @IBAction func scheduleSingleService(_ sender: Any) {
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
