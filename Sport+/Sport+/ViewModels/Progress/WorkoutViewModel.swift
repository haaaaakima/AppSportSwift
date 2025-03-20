//
//  WorkoutViewModel.swift
//  Mory
//
//  Created by apprenant106 on 18/03/2025.
//

import Foundation

class WorkoutViewModel: ObservableObject {
    @Published var sessions: [Session] = []
    @Published var progress: Double = 0.75

    func loadSessions() {
        // Ajoutez une logique pour charger des sessions si nécessaire
    }
}
