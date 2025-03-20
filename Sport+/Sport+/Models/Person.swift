//  Person.swift
//  Sport+
//
//  Created by DevTipsy94 on 05/03/2025.
//

import Foundation
import SwiftData

@Model
class Person: Identifiable {
    var id: Int
    var name: String
    var city: String
    var age: Int
    var height: Double
    var weight: Double
    var image: String
    var describe: String
    var level: Level
    var phoneNumber: String
    
    var preference: [Preference]?
    
    init(id : Int, name: String, city: String, age: Int, height: Double, weight: Double, image: String, describe: String, level: Level, phoneNumber: String, preference: [Preference]? = nil) {
        self.id = id
        self.name = name
        self.city = city
        self.age = age
        self.height = height
        self.weight = weight
        self.image = image
        self.describe = describe
        self.level = level
        self.phoneNumber = phoneNumber
        self.preference = preference
    }
}
