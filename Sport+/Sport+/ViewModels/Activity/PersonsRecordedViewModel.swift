//
//  PersonsRecordedViewModel.swift
//  Sport+
//
//  Created by Mouhamadou SALL on 12/03/2025.
//

import Foundation


class PersonsRecordedViewModel : ObservableObject {
    let activity : Activity
    
    init(activity: Activity) {
        self.activity = activity
    }
    
    
    var personsRecorded : [Person] {
       personsDataBase.filter {
           activity.personsRecordedIDs.contains($0.id)
        }
        
    }
}
