//
//  CreatedActivitiesView.swift
//  Sport+
//
//  Created by DevTipsy94 on 11/03/2025.
//

import SwiftUI

struct CreatedActivitiesView: View {
    let person: Person
    let activities: [Activity]
    let screenWidth: CGFloat
    let dateFormatter: DateFormatter
    let timeFormatter: DateFormatter
    
    var body: some View {
        let createdActivities: [Activity] = activities.filter{$0.authorID == person.id}
        
        // MARK: - Activités créées par l'utilisateur
        Text("Mes Activités Créées")
            .font(.custom("IntegralCF-MediumOblique", size: 20))
            .foregroundStyle(.white)
            .padding(.top)
            .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15){
                        if createdActivities.isEmpty {
                            Text("Vous n'avez créé aucune activité.")
                                .foregroundStyle(.gray)
                                .italic()
                                .padding()
                        } else {
                            ForEach(createdActivities.sorted { $0.date < $1.date }) { activity in
                                NavigationLink(
                                    destination: ActivityEditView(
                                        activity: activity,
                                        viewModel: ActivityListViewModel(activityRepository: ActivityRepository.shared)
                                    )
                                ) {
                                    ActivityCardView(activity: activity, cardWidth: 365)
                                }
                            }
                        }
                    }.padding(.horizontal)
                }

            }
        }
