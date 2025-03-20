//
//  DailyProgress.swift
//  Mory
//
//  Created by apprenant106 on 18/03/2025.
//


import Foundation

struct DailyProgress: Identifiable {
    var id = UUID()
    var day: String // Ex : "Lundi", "Mardi"
    var progress: Double // Rendue mutable avec var
    var trainingType: String // Ex : "Course", "Yoga", "Musculation"
}
