//
//  AppointmentController.swift
//  Smart-Lawn-App
//
//  Created by Austin Potts on 9/28/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import CoreData

class AppointmentController {
    
    //Crud
    
    @discardableResult func createAppointment(username: String, service: String, directions: String)-> Appointment {
        
        let appointment = Appointment(username: username, service: service, directions: directions, context: CoreDataStack.share.mainContext)
        
        CoreDataStack.share.saveToPersistentStore()
        
        return appointment
    }
    
    
    func updateAppointment(appointment: Appointment, with username:String, service: String, directions: String) {
        appointment.username = username
        appointment.service = service
        appointment.directions = directions
        
        CoreDataStack.share.saveToPersistentStore()
    }
    
    func deleteAppointment(appointment: Appointment) {
        CoreDataStack.share.mainContext.delete(appointment)
        CoreDataStack.share.saveToPersistentStore()
    }
    
    
    
}
