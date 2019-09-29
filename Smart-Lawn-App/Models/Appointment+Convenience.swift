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
    
    
    
    var appointmentRepresentation: AppointmentRepresentation? {
        guard let username = username,
        let service = service,
        let directions = directions,
            let identifier = identifier?.uuidString else {return nil}
        return AppointmentRepresentation(username: username, service: service, directions: directions, identifier: identifier)
    }
    
    
    convenience init(username: String, service: String, directions: String, identifier: UUID = UUID(), context: NSManagedObjectContext) {
        
        self.init(context: context)
        self.username = username
        self.service = service
        self.directions = directions
        self.identifier = identifier
    }
    
    
    
    @discardableResult convenience init?(appointmentRepresentation: AppointmentRepresentation, context: NSManagedObjectContext) {
        guard let identifier = UUID(uuidString: appointmentRepresentation.identifier) else {return nil}
        
        self.init(username: appointmentRepresentation.username, service: appointmentRepresentation.service, directions: appointmentRepresentation.directions, identifier: identifier, context: context)
    }
    
    
    
}
