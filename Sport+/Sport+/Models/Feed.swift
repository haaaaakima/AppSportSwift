//
//  Feed.swift
//  Sport+
//
//  Created by Mouhamadou SALL on 07/03/2025.
//

import Foundation
import SwiftData

@Model
class Feed : Identifiable {
    var id : UUID = UUID()
    var postID : UUID
    var poste : String
    var image : [String]
    
    init(id: UUID, postID: UUID, poste: String, image: [String]) {
        self.id = id
        self.postID = postID
        self.poste = poste
        self.image = image
    }
}
