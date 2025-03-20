//
//  ActivityDetailViewModel.swift
//  Sport+
//
//  Created by Mouhamadou SALL on 07/03/2025.
//

import SwiftUI


class ActivityDetailViewModel : ObservableObject {
    
    @Published var activity: Activity
    @Published var isParticipating: Bool = false
        
    init(activity: Activity) {
        self.activity = activity
    }
    
    var personsRecorded : [Person] {
       personsDataBase.filter {
           activity.personsRecordedIDs.contains($0.id)
        }
        
    }
    
    func personRecordedToActivity() {
        let newPerson: Person = personsDataBase[3]
        if !activity.personsRecordedIDs.contains(newPerson.id) {
            activity.personsRecordedIDs.append(newPerson.id)
        }
    }
    
    func personRecordedDeleteToActivity() {
        let deletePerson: Person = personsDataBase[3]
        if activity.personsRecordedIDs.contains(deletePerson.id) {
            if let index = activity.personsRecordedIDs.firstIndex(of: deletePerson.id) {
                activity.personsRecordedIDs.remove(at: index)
            }
        }
    }
    
}
