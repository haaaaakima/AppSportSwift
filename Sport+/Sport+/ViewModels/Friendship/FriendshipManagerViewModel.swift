//
//  FriendshipManagerViewModel.swift
//  Sport+
//
//  Created by DevTipsy94 on 17/03/2025.
//

import Foundation
import SwiftData

class FriendshipManagerViewModel: ObservableObject {
    @Published
    
    var friendIDs: [Int] = []
    
    init() {
        // Charger les amis depuis UserDefaults ou une autre source persistante
        loadFriends()
    }
    
    func addFriend(_ personID: Int) {
        if !friendIDs.contains(personID) {
            friendIDs.append(personID)
            saveFriends()
        }
    }
    
    func removeFriend(_ personID: Int) {
        friendIDs.removeAll { $0 == personID }
        saveFriends()
    }
    
    func isFriend(_ personID: Int) -> Bool {
        return friendIDs.contains(personID)
    }
    
    private func saveFriends() {
        // Enregistrer dans UserDefaults
        if let data = try? JSONEncoder().encode(friendIDs) {
            UserDefaults.standard.set(data, forKey: "friendIDs")
        }
    }
    
    private func loadFriends() {
        // Charger depuis UserDefaults
        if let data = UserDefaults.standard.data(forKey: "friendIDs"),
           let ids = try? JSONDecoder().decode([UUID].self, from: data) {
            friendIDs = [1, 2, 3, 4]
        }
    }
}
