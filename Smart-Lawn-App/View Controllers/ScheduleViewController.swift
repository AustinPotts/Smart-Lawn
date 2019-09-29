//
//  ScheduleViewController.swift
//  Smart-Lawn-App
//
//  Created by Austin Potts on 9/28/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {

    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var servicePicker: UIPickerView!
    @IBOutlet weak var directionsTextview: UITextView!
    
    var pickerData: [String] = []
    var pickerSelection: String?
    
    var appointmentController: AppointmentController?
    var appointment: Appointment?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()

        servicePicker.dataSource = self
        servicePicker.delegate = self
        
        pickerData = ["Lawn Mowing", "Weed Wack", "Leaf Blower", "Branch Trimming", "Bush Sculpting"]
    }
    
    
    @IBAction func save(_ sender: Any) {
        guard let username = usernameTextField.text,
        !username.isEmpty,
        let service = pickerSelection,
        let directions = directionsTextview.text,
            !directions.isEmpty else {return}
        
        if let appointments = appointment {
            appointmentController?.updateAppointment(appointment: appointments, with: username, service: service, directions: directions)
        } else {
            self.appointmentController?.createAppointment(username: username, service: service, directions: directions)
            
            
        }
        
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
    func updateViews(){
        title = appointment?.username ?? "Schedule"
        
        usernameTextField.text = appointment?.username
        directionsTextview.text = appointment?.directions
        //pickerSelection = appointment?.service
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

extension ScheduleViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerSelection = pickerData[row]
    }
    
}
