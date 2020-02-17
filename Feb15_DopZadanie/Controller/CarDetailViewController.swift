//
//  EditViewController.swift
//  Feb15_DopZadanie
//
//  Created by Ivan on 2/17/20.
//  Copyright © 2020 Ivan Zuev. All rights reserved.
//

import UIKit

class CarDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var car = Car()
    var index = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "detailcell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CarDetailTableViewCell
        
        cell.nameLabel.text = car.name
        cell.brandLabel.text = car.brand
        cell.descriptionLabel.text = car.description
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editDetailCar" {
            let destinationController = segue.destination as! EditCarViewController
            
            destinationController.index = index
            destinationController.car = car
        }
    }
}

extension CarDetailViewController: UITableViewDelegate { }

extension CarDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
