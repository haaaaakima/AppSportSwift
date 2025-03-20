//
//  ActivityDatabase.swift
//  Sport+
//
//  Created by Mouhamadou SALL on 07/03/2025.
//

import Foundation
import SwiftUI
import SwiftData

// MARK: - Les données fictives d'activity

var activities : [Activity] = [
    Activity(
        name: "Musculation",
        sportType: .musculation,
        date: Date(),
        numberOfParticipant: 1,
        personsRecordedIDs: [personsDataBase[0].id, personsDataBase[1].id],
        authorID: personsDataBase[1].id,
        cityActivity: "Parc des Princes",
        activityDescription: "Séance de musculation au Parc des Princes. L'objectif est de se préparer pour la compétition intergalactique qui a lieu tous les 10 ans sur la planète Mars."
    ),
    Activity(
        name: "Yoga",
        sportType: .yoga,
        date: Calendar.current.date(byAdding: .day, value: 2, to: Date())!,
        numberOfParticipant: 1,
        personsRecordedIDs: [personsDataBase[0].id, personsDataBase[1].id],
        authorID: personsDataBase[0].id,
        cityActivity: "Lyon",
        activityDescription: "Séance de yoga en plein air au Parc de la Tête d'Or."
    ),
    Activity(
        name: "Basket",
        sportType: .basket,
        date: Calendar.current.date(byAdding: .day, value: 3, to: Date())!,
        numberOfParticipant: 1,
        personsRecordedIDs: [personsDataBase[2].id, personsDataBase[5].id, personsDataBase[3].id],
        authorID: personsDataBase[2].id,
        cityActivity: "Toulouse",
        activityDescription: "Match de basket entre amis au gymnase municipal."
    ),
    
    Activity(
        name: "Randonnee",
        sportType: .randonnee,
        date: Calendar.current.date(byAdding: .day, value: 5, to: Date())!,
        numberOfParticipant: 1,
        personsRecordedIDs: [personsDataBase[6].id, personsDataBase[7].id],
        authorID: personsDataBase[6].id,
        cityActivity: "Grenoble",
        activityDescription: "Randonnée en montagne pour admirer le lever du soleil."
    ),
    
    Activity(
        name: "Tennis",
        sportType: .tennis,
        date: Calendar.current.date(byAdding: .day, value: 4, to: Date())!,
        numberOfParticipant: 1,
        personsRecordedIDs: [personsDataBase[5].id ,personsDataBase[8].id, personsDataBase[9].id],
        authorID: personsDataBase[9].id,
        cityActivity: "Nantes",
        activityDescription: "Tournoi de tennis amateur au club local."
    )
]
