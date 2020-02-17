//
//  EditCarViewController.swift
//  Feb15_DopZadanie
//
//  Created by Ivan on 2/17/20.
//  Copyright © 2020 Ivan Zuev. All rights reserved.
//

import UIKit

class EditCarViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = navigationController?.popToRootViewController(animated: true)
        
        nameTextField.delegate = self
        brandTextField.delegate = self
        descriptionTextField.delegate = self
    }
    
    var car = Car()
    var index = Int()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameTextField.text = car.name
        brandTextField.text = car.brand
        descriptionTextField.text = car.description
    }
    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveEditCar" {
            let destinationController = segue.destination as! CarViewController
            
            car.name = nameTextField.text ?? ""
            car.brand = brandTextField.text ?? ""
            car.description = descriptionTextField.text ?? ""
            
            destinationController.cars[index] = car
        }
    }
}

extension EditCarViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
}
