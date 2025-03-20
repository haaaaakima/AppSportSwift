//
//  DateExtension.swift
//  Sport+
//
//  Created by Mouhamadou SALL on 10/03/2025.
//

import Foundation

extension Date {
    var month : String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.dateFormat = "MMMM"
        let formattedDate = formatter.string(from: self)
        return formattedDate
    }
    
    var day : String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.dateFormat = "dd"
        let formattedDate = formatter.string(from: self)
        return formattedDate
    }
    
    var dayAndMonth : String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.dateFormat = "dd MMMM"
        return formatter.string(from: self)
    }
    var dateNormal : String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.dateFormat = "dd MMMM yyyy HH:mm"
        return formatter.string(from: self)
    }

}
