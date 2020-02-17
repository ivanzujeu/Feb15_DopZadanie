//
//  Car.swift
//  Feb15_DopZadanie
//
//  Created by Ivan on 2/17/20.
//  Copyright © 2020 Ivan Zuev. All rights reserved.
//

import Foundation

class Car {
    var name: String
    var brand: String
    var description: String
    
    init(name: String, brand: String, description: String) {
        self.name = name
        self.brand = brand
        self.description = description
    }
    
    convenience init() {
        self.init(name: "", brand: "", description: "")
    }
}
