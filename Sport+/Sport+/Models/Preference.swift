//
//  Preference.swift
//  Sport+
//
//  Created by apprenant107 on 10/03/2025.
//

import Foundation
import SwiftData

@Model
class Preference: Identifiable {
    var id: UUID = UUID()
    var sportType: Sport
    var image: String
    
    init(sportType: Sport, image: String) {
        self.sportType = sportType
        self.image = image
    }
}
