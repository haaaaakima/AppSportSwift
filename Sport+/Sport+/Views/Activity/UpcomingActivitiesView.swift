//
//  UpcomingActivitiesView.swift
//  Sport+
//
//  Created by DevTipsy94 on 11/03/2025.
//

import SwiftUI

struct UpcomingActivitiesView: View {
    let person: Person
    let activities: [Activity]
    let screenWidth: CGFloat
    let dateFormatter: DateFormatter
    let timeFormatter: DateFormatter
    
    var body: some View {
        // Modification ici pour filtrer correctement
        let upcomingActivities: [Activity] = activities.filter { $0.personsRecordedIDs.contains(person.id) }
        
        VStack(alignment: .leading) {
            Text("ACTIVITÉS À VENIR")
                .font(.custom("IntegralCF-MediumOblique", size: 20))
                .foregroundColor(.white)
                .padding(.top)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    if upcomingActivities.isEmpty {
                        Text("Vous n'avez aucune activité à venir.")
                            .foregroundStyle(.gray)
                            .italic()
                            .padding()
                    } else {
                        ForEach(upcomingActivities.sorted { $0.date < $1.date }) { activity in
                            NavigationLink(destination: ActivityDetailView(viewModel: ActivityDetailViewModel(activity: activity))) {
                                ActivityCardView(activity: activity, cardWidth: 365)
                            }
                        }
                    }
                }.padding(.horizontal)
            }
        }
    }
}
