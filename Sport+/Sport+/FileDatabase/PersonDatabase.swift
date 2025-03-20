//
//  PersonDatabase.swift
//  Sport+
//
//  Created by Mouhamadou SALL on 07/03/2025.
//

import Foundation
import SwiftUI
import SwiftData


// MARK: - Les données fictives de personnes

var personsDataBase: [Person] = [
    Person(id: 1, name: "Alice Martin", city: "Paris", age: 28, height: 1.68, weight: 60.0, image: "alice", describe: "Passionnée de randonnée et de yoga. J'aime la nature et les oiseaux", level: .intermediaire, phoneNumber: "0601020304"),
    Person(id: 2, name: "Bruno Dupont", city: "Lyon", age: 35, height: 1.75, weight: 78.0, image: "bruno", describe: "Amateur de football et de course à pied.", level: .experimente, phoneNumber: "0605060708"),
    Person(id: 3, name: "Claire Dubois", city: "Marseille", age: 24, height: 1.60, weight: 52.0, image: "claire", describe: "Passionnée de natation.", level: .debutant, phoneNumber: "0611223344"),
    Person(id: 4, name: "David Morel", city: "Toulouse", age: 40, height: 1.80, weight: 85.0, image: "david", describe: "Adepte de musculation.", level: .experimente, phoneNumber: "0611334455"),
    Person(id: 5, name: "Emma Laurent", city: "Nice", age: 30, height: 1.65, weight: 58.0, image: "emma", describe: "Fan de danse et de fitness.", level: .intermediaire, phoneNumber: "0611445566"),
    Person(id: 6, name: "Fabien Leroy", city: "Bordeaux", age: 27, height: 1.78, weight: 70.0, image: "fabien", describe: "Joueur de tennis passionné.", level: .intermediaire, phoneNumber: "0612556677"),
    Person(id: 7, name: "Gabrielle Lefèvre", city: "Lille", age: 22, height: 1.62, weight: 55.0, image: "gabrielle", describe: "Débutante en escalade.", level: .debutant, phoneNumber: "0613667788"),
    Person(id: 8, name: "Hugo Bernard", city: "Nantes", age: 34, height: 1.85, weight: 90.0, image: "hugo", describe: "Passionné de rugby.", level: .experimente, phoneNumber: "0614778899"),
    Person(id: 9, name: "Isabelle Rousseau", city: "Strasbourg", age: 29, height: 1.70, weight: 62.0, image: "isabelle", describe: "Fan de randonnée.", level: .intermediaire, phoneNumber: "0615889900"),
    Person(id: 10, name: "Julien Simon", city: "Rennes", age: 31, height: 1.75, weight: 75.0, image: "julien", describe: "Coureur de marathon.", level: .experimente, phoneNumber: "0616990011"),
    Person(id: 11, name: "Karine Blanc", city: "Dijon", age: 26, height: 1.68, weight: 59.0, image: "karine", describe: "Passionnée de yoga.", level: .intermediaire, phoneNumber: "0617001122"),
    Person(id: 12, name: "Lucas Perrin", city: "Clermont-Ferrand", age: 38, height: 1.83, weight: 88.0, image: "lucas", describe: "Fan de trail.", level: .experimente, phoneNumber: "0618112233"),
    Person(id: 13, name: "Marie Petit", city: "Grenoble", age: 25, height: 1.63, weight: 54.0, image: "marie", describe: "Amatrice de ski.", level: .intermediaire, phoneNumber: "0619223344"),
    Person(id: 14, name: "Nicolas Robin", city: "Le Havre", age: 33, height: 1.82, weight: 83.0, image: "nicolas", describe: "Fan de football.", level: .intermediaire, phoneNumber: "0620334455"),
    Person(id: 15, name: "Océane Girard", city: "Angers", age: 21, height: 1.64, weight: 56.0, image: "oceane", describe: "Débutante en crossfit.", level: .debutant, phoneNumber: "0621445566"),
    Person(id: 16, name: "Paul Gauthier", city: "Saint-Étienne", age: 36, height: 1.77, weight: 80.0, image: "paul", describe: "Passionné de cyclisme.", level: .experimente, phoneNumber: "0622556677"),
    Person(id: 17, name: "Quentin Faure", city: "Toulon", age: 32, height: 1.79, weight: 77.0, image: "quentin", describe: "Fan de plongée sous-marine.", level: .intermediaire, phoneNumber: "0623667788"),
    Person(id: 18, name: "Rachel Noël", city: "Orléans", age: 27, height: 1.67, weight: 60.0, image: "rachel", describe: "Débutante en pilates.", level: .debutant, phoneNumber: "0624778899"),
    Person(id: 19, name: "Sébastien Rolland", city: "Reims", age: 41, height: 1.85, weight: 92.0, image: "sebastien", describe: "Adepte de musculation.", level: .experimente, phoneNumber: "0625889900"),
    Person(id: 20, name: "Théo Meunier", city: "Aix-en-Provence", age: 23, height: 1.70, weight: 65.0, image: "theo", describe: "Débutant en natation.", level: .debutant, phoneNumber: "0626990011")
]

// Variable pour stocker l'ID de l'utilisateur courant (première personne dans le tableau)
var currentUserID: Int = personsDataBase[0].id

// Fonction pour récupérer la personne par son senderID (UUID)
func getPerson(for senderID: Int) -> Person? {
    return personsDataBase.first { $0.id == senderID }
}
