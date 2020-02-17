//
//  ViewController.swift
//  Feb15_DopZadanie
//
//  Created by Ivan on 2/17/20.
//  Copyright © 2020 Ivan Zuev. All rights reserved.
//

import UIKit

class CarViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
         dismiss(animated: true, completion: nil)
    }
    
    @IBAction func unwindAndSaveToHome(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func unwindAndEditToHome(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    
    var cars = [Car(name: "Audi A8", brand: "Audi", description: "Nice interior.")]
    var newCar: Car?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        if newCar != nil {
            cars.append(newCar!)
            newCar = nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CarTableViewCell
        
        cell.nameLabel.text = cars[indexPath.row].name
        cell.brandLabel.text = cars[indexPath.row].brand
        cell.descriptionLabel.text = cars[indexPath.row].description
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCar" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! CarDetailViewController
                
                let car: Car
                car = cars[indexPath.row]
                destinationController.car = car
                destinationController.index = indexPath.row
            }
        }
    }
}

extension CarViewController: UITableViewDelegate { }

extension CarViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cars.count
    }
}

