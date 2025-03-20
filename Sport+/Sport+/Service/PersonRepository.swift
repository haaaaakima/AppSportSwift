//
//  PersonServiceRepository.swift
//  Sport+
//
//  Created by Mouhamadou SALL on 13/03/2025.
//

import Foundation

import Foundation

import SwiftData

@MainActor
class PersonRepository {
    private let modelContext: ModelContext
    
    // Un singleton permet d'avoir une SEULE et UNIQUE instance d'une classe dans toute l'application.
    
    // Pour faire cela, la classe SwiftDataService a un private init(), ce qui veut dire qu'on ne peux pas créér un objet SwiftDataService de l'exterieur.
    // Pour acceder à SwiftDataService, on doit obligatoirement passer par SwiftDataService.shared qui contient l'instance unique de la classe.
    
    // Pourquoi ? Parce que parfois, on a besoin de partager les mêmes données ou
    // les mêmes fonctionnalités partout (ex: gestion de la base de données, session utilisateur, accès réseau, etc.).
    
    static let shared = PersonRepository() // Instance unique accessible partout
    
    // Initialisation privée : personne ne peut appeler ce init() en dehors de cette classe.
    private init() {
        // On récupere le ModelContainer pour pouvoir créer le modelContext, qui est la base / la box pour sauvegarder les données, les modifiers, les supprimer etc
        let modelContainer = try! ModelContainer(for: Person.self) // Penser à changer le type que vous souhaitez sauvegarder. Ici le type est "Expense".
        self.modelContext = ModelContext(modelContainer)
    }
    
    
    // MARK: - Nos fonctions SwifData concernant notre type "Expense" (récuperation, sauvegarde etc).
    
    func fetchExpenses() -> [Person] {
        do {
            return try modelContext.fetch(FetchDescriptor<Person>())
        } catch {
            print("Erreur lors du fetch des datas : \(error.localizedDescription)")
            return []
        }
    }
    
    func addExpense(_ person: Person) {
        modelContext.insert(person)
        do {
            try modelContext.save()
        } catch {
            print("Erreur lors de la sauvegarde de la data : \(error.localizedDescription)")
        }
    }
}
