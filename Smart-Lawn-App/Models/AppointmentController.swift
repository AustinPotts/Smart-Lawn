//
//  AppointmentController.swift
//  Smart-Lawn-App
//
//  Created by Austin Potts on 9/28/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import CoreData

enum HTTPMethod: String{
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}


class AppointmentController {
    
    
    let fireBaseURL = URL(string: "https://smartlawn-5f241.firebaseio.com/")!
    
    func put(appointment: Appointment, completion: @escaping()-> Void = {}) {
        
        let identifer = appointment.identifier ?? UUID()
        appointment.identifier = identifer
        
        let requestURL = fireBaseURL.appendingPathComponent(identifer.uuidString).appendingPathExtension("json")
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.put.rawValue
        
        guard let appointmentRepresentation = appointment.appointmentRepresentation else {
            NSLog("Error")
            completion()
            return
        }
        
        do {
          request.httpBody = try JSONEncoder().encode(appointmentRepresentation)
        } catch{
            NSLog("Error encoding:\(error)")
            completion()
            return
        }
        
        URLSession.shared.dataTask(with: request) {(_,_, error) in
            if let error = error {
                NSLog("Error performing tasks: \(error)")
                completion()
                return
            }
            completion()
        }.resume()
        
        
    }
    
    
    func fetchFromServer(completion: @escaping()-> Void = {}){
        
        let requestURL = fireBaseURL.appendingPathExtension("json")
        
        URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
            if let error = error{
                NSLog("error fetching tasks: \(error)")
                completion()
            }
            
            guard let data = data else{
                NSLog("Error getting data task:")
                completion()
                return
            }
            
            do{
                let decoder = JSONDecoder()
                
          let appointmentRepresentations = Array(try decoder.decode([String: AppointmentRepresentation].self, from: data).values)
                
                self.update(with: appointmentRepresentations)
                
            } catch {
                NSLog("Error decoding: \(error)")
                
            }
            
        }.resume()
        
        
    }
    
    
    func update(with representation: [AppointmentRepresentation]){
        
        let identifiersToFetch = representation.compactMap({UUID(uuidString: $0.identifier)})
        
        let representationByID = Dictionary(uniqueKeysWithValues: zip(identifiersToFetch, representation))
        
        var appointmentToCreate = representationByID
        
        let context = CoreDataStack.share.container.newBackgroundContext()
        context.performAndWait {
            
            do{
                let fetchRequest: NSFetchRequest<Appointment> = Appointment.fetchRequest()
                
                fetchRequest.predicate = NSPredicate(format: "identifer IN %@", identifiersToFetch)
                
               let exisitngAppointment = try context.fetch(fetchRequest)
                
                for appointment in exisitngAppointment {
                    guard let identifier = appointment.identifier,
                        let representation = representationByID[identifier] else {return}
                    
                    appointment.username = representation.username
                    appointment.service = representation.service
                    appointment.directions = representation.directions
                    
                    appointmentToCreate.removeValue(forKey: identifier)
                }
                
                for representation in appointmentToCreate.values{
                    Appointment(appointmentRepresentation: representation, context: context)
                }
                
                CoreDataStack.share.save(context: context)
                
            } catch {
                NSLog("Error fetching appointments: \(error)")
            }
            
            
        }
        
    }
    
    
    
    
    
    
    //Crud
    
    @discardableResult func createAppointment(username: String, service: String, directions: String)-> Appointment {
        
        let appointment = Appointment(username: username, service: service, directions: directions, context: CoreDataStack.share.mainContext)
        
        put(appointment: appointment)
        CoreDataStack.share.save()
        
        return appointment
    }
    
    
    func updateAppointment(appointment: Appointment, with username:String, service: String, directions: String) {
        appointment.username = username
        appointment.service = service
        appointment.directions = directions
        
        put(appointment: appointment)
        CoreDataStack.share.save()
    }
    
    func deleteAppointment(appointment: Appointment) {
        CoreDataStack.share.mainContext.delete(appointment)
        CoreDataStack.share.save()
    }
    
    
    
}
