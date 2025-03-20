//
//  ActivityListViewModel.swift
//  Sport+
//
//  Created by Mouhamadou SALL on 07/03/2025.
//

import Foundation
import Observation


@MainActor
class ActivityListViewModel : ObservableObject {
    
    @Published var activitiesData : [Activity] = []
    @Published var searchBySport : String = ""
    @Published var selectedDate : Date? = nil

   
    var yesterday : Date = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
    
    private let activityRepository: ActivityRepository
    
    // A l'init du viewModel on nous demande de founrir le SwiftDataService :
    init(activityRepository : ActivityRepository) {
        self.activityRepository = activityRepository
        // Mise à jour de notre tableau d'expenses via les données de SwiftData :
        activitiesData = activityRepository.fetchActivity()
    }
    
    func addSampleExpense() {
        // Sauvegarde de la donnée dans SwiftData :
        for activity in activities{
            activityRepository.addActivity(activity)
        }
        
        // Mise à jour de notre tableau d'expenses via les données de SwiftData :
        activitiesData = activityRepository.fetchActivity()
    }
    
    func addActivity(activity: Activity) {
        activityRepository.addActivity(activity)
    }
    
    func fetchActivity(){
        activitiesData = activityRepository.fetchActivity()
    }
    
    func updateActivity(activity: Activity) {
        activityRepository.updateActivity(activity)
    }
    
    func deleteActivity(activity: Activity){
        activityRepository.deleteActivity(activity)
        activitiesData = activityRepository.fetchActivity()
    }
    
    var filteredActivitiesBySportORByDate : [Activity] {
        let filtredActivityByDate : [Activity]
        if let selectedDate = selectedDate {
            filtredActivityByDate = activitiesData.filter {
                $0.date.dayAndMonth == selectedDate.dayAndMonth
            }
        }else {
            filtredActivityByDate = activitiesData // Si `selectedDate` est nil, on garde tout
        }
        
        if searchBySport.isEmpty {
            return filtredActivityByDate
        } else {
            return filtredActivityByDate.filter {
                $0.sportType.rawValue.lowercased().contains(searchBySport.lowercased())
            }
        }
        
    }
    
    // MARK: - Fonction qui d'affiche les dates pour le filtre
    
    func genererDates() -> [Date] {
        let calendar = Calendar.current
        let today = Date()
        var dates: [Date] = []
        for i in 0..<30 {
            if let futureDate = calendar.date(byAdding: .day, value: i, to: today) {
                dates.append(futureDate)
            }
        }
        
        return dates
    }
}
