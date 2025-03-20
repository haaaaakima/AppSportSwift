//
//  LandingScreenView.swift
//  Sport+
//
//  Created by DevTipsy94 on 05/03/2025.
//

import SwiftUI
import SwiftData

struct LandingScreenView: View {
    @Environment(\.modelContext) private var modelContext
    // Données fictives pour le profil
    let person = personsDataBase[0]
    
    var upcomingActivities: [Activity] {
        activities.filter { $0.personsRecordedIDs.contains(person.id) }
    }
    
    var createdActivities: [Activity] {
        activities.filter { $0.authorID == person.id }
    }
    
    init() {
           let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = UIColor.purpleBackground // Couleur de la barre
           UITabBar.appearance().standardAppearance = tabBarAppearance
           UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
       }

    var body: some View {
        TabView {
            ActivityListView()
                .tabItem {
                    Label("Activités", systemImage: "calendar")
                }
            
            ActivityCreateView()
                .tabItem {
                    Label("Créer", systemImage: "calendar.badge.plus")
                }
            
            MessageView(viewModel: MessageViewModel(currentUserID: person.id, modelContext: modelContext))
                .tabItem {
                    Label("Messages", systemImage: "message.fill")
                }
            
            ProfileView(
                person: person,
                upcomingActivities: upcomingActivities
            )
            .tabItem {
                Label("Profil", systemImage: "person")
            }
        }
        .accentColor(.vert)
    }
}


#Preview {
    LandingScreenView()
}
