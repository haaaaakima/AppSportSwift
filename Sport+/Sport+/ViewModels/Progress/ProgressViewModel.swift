//
//  ProgressViewModel.swift
//  Mory
//
//  Created by apprenant106 on 18/03/2025.
//
import SwiftUI

class ProgressViewModel: ObservableObject {
    @Published var weeklyProgress: [DailyProgress] = []

    init() {
        generateWeeklyProgress()
    }

    func generateWeeklyProgress() {
        let days = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"]
        let trainingTypes = ["Course", "Yoga", "Musculation", "Natation", "Cardio", "Repos", "HIIT"]

        weeklyProgress = days.enumerated().map { index, day in
            DailyProgress(
                day: day,
                progress: Double.random(in: 0.5...1.0),
                trainingType: trainingTypes[index % trainingTypes.count] // Cycle à travers les types
            )
        }
    }
}
