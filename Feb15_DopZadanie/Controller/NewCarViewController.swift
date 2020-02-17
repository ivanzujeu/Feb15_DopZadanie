//
//  NewCarViewController.swift
//  Feb15_DopZadanie
//
//  Created by Ivan on 2/17/20.
//  Copyright © 2020 Ivan Zuev. All rights reserved.
//

import UIKit

class NewCarViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    var car = Car()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = navigationController?.popToRootViewController(animated: true)
        
        nameTextField.delegate = self
        brandTextField.delegate = self
        descriptionTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addCar" {
            
            let destinationController = segue.destination as! CarViewController
            
            car.name = nameTextField.text ?? ""
            car.brand = brandTextField.text ?? ""
            car.description = descriptionTextField.text ?? ""
            
            destinationController.newCar = car
        }
    }
}

extension NewCarViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
}
