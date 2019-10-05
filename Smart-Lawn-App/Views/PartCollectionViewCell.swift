//
//  PartCollectionViewCell.swift
//  Smart-Lawn-App
//
//  Created by Austin Potts on 10/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PartCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var partImage: UIImageView!
    @IBOutlet weak var partLabel: UILabel!
    
    
    var serviceProvided: ServiceProvided? {
        didSet{
            updateViews()
        }
    }
    
  func updateViews(){
    guard let serviceProvided = serviceProvided else {return}
    partImage.image = serviceProvided.image
    partLabel.text = serviceProvided.name
    }
    
}
