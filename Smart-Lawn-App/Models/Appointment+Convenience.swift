//
//  Appointment+Convenience.swift
//  Smart-Lawn-App
//
//  Created by Austin Potts on 9/28/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import CoreData

extension Appointment {
    
    
    convenience init(username: String, service: String, directions: String, context: NSManagedObjectContext) {
        
        self.init(context: context)
        self.username = username
        self.service = service
        self.directions = directions
     //   self.identifier = identifier
    }
    
    
}
