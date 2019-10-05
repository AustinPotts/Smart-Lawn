//
//  ServicePart.swift
//  Smart-Lawn-App
//
//  Created by Austin Potts on 10/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit


class ServiceProvided {
    
    var name: String
    var id: String
    var image: UIImage
    
    init(name: String, id: String, imageName: String) {
        self.image = UIImage(named: imageName)!
        self.name = name
        self.id = id
        
        
    }
    
}
