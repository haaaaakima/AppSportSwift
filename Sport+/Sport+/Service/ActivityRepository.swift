//
//  SwiftData.swift
//  Sport+
//
//  Created by Mouhamadou SALL on 13/03/2025.
//

import Foundation

import SwiftData

@MainActor
class ActivityRepository {
    private let modelContext: ModelContext

    static let shared = ActivityRepository() // Instance unique accessible partout
    
    private init() {
//        let schema = Schema([Activity.self, Person.self])
        let modelContainer = try! ModelContainer(for: Activity.self) // Penser à changer le type que vous souhaitez sauvegarder. Ici le type est "Activty".
        self.modelContext = ModelContext(modelContainer)
    }
    
    
    // MARK: - Nos fonctions SwifData concernant notre type "Activity" (récuperation, sauvegarde etc).
    
    func fetchActivity() -> [Activity] {
        do {
            return try modelContext.fetch(FetchDescriptor<Activity>())
        } catch {
            print("Erreur lors du fetch des datas : \(error.localizedDescription)")
            return []
        }
    }
    
    func addActivity(_ activity: Activity) {
        modelContext.insert(activity)
        do {
            try modelContext.save()
        } catch {
            print("Erreur lors de la sauvegarde de la data : \(error.localizedDescription)")
        }
    }
    
    func updateActivity(_ activity: Activity){
        do{
            try modelContext.save()
        } catch {
            print("Erreur lors de la sauvegarde de la data : \(error.localizedDescription)")
        }
    }
    
    func deleteActivity(_ activity: Activity){
        modelContext.delete(activity)
        do {
            try modelContext.save()
        } catch {
            print("Erreur lors de la sauvegarde de la data : \(error.localizedDescription)")
        }
    }
    
    
    //MARK: -  Nos fonctions concernant notre type Person
    func fetchPersons() -> [Person] {
        do {
            return try modelContext.fetch(FetchDescriptor<Person>())
        } catch {
            print("Erreur lors du fetch des datas : \(error.localizedDescription)")
            return []
        }
    }
    
    func addPerson(_ person: Person) {
        modelContext.insert(person)
        do {
            try modelContext.save()
        } catch {
            print("Erreur lors de la sauvegarde de la data : \(error.localizedDescription)")
        }
    }
    

}
