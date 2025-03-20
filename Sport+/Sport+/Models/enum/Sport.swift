//
//  SportType.swift
//  Sport+
//
//  Created by Mouhamadou SALL on 05/03/2025.
//


import SwiftUI
import SwiftData

enum Sport : String, Codable, CaseIterable{
    case course = "COURSE"
    case basket = "BASKET"
    case yoga = "YOGA"
    case musculation = "MUSCULATION"
    case tennis = "TENNIS"
    case foot = "FOOT"
    case randonnee = "RANDONNEE"
    case boxe = "BOXE"
    case natation = "NATATION"
    case velo = "VELO"
    case rugby = "RUGBY"
    
    var imageSport: ImageResource {
        switch self {
        case .course:
            return .course
        case .basket:
            return .basket
        case .yoga:
            return .yoga
        case .musculation:
            return .musculation
        case .tennis:
            return .tennis
        case .foot:
            return .foot
        case .randonnee:
            return .randonnee
        case .boxe:
            return .boxe
        case .natation:
            return .natation
        case .velo:
            return .velo
        case .rugby:
            return .rugby
        }
    }
}
