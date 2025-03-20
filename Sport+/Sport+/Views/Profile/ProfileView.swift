//
// ProfileView.swift
// Sport+
//
// Created by devTipsy94 on 11/03/2025.
//

import SwiftUI

struct ProfileView: View {
    
    @State var viewModel : ActivityListViewModel = ActivityListViewModel(activityRepository: ActivityRepository.shared)
    
    let person: Person
    let upcomingActivities: [Activity]
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    private let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("PurpleBackground")
                    .ignoresSafeArea()
                
                let screenWidth = UIScreen.main.bounds.width
                
                ScrollView {
                    VStack(alignment: .leading) {
                        // Image de profil
                        HStack(spacing: 15) {
                            VStack {
                                Image(person.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(60)
                                    .overlay(
                                        Circle().stroke(Color.green.opacity(1), lineWidth: 3)
                                    )
                            }
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    // Nom de la personne
                                    Text(person.name)
                                        .font(.custom("IntegralCF-Regular", size: 20))
                                    Spacer()
                                }
                                // Ville de la personne
                                Text(person.city)
                                    .font(.caption)
                                    .italic()
                                
                                // Age, taille formatée et poids formaté de la personne
                                HStack(spacing: 0) {
                                    Text("\(person.age) ans")
                                    Text("  |  ")
                                        .foregroundColor(Color("Vert"))
                                    Text("\(person.height, specifier: "%.2f")m")
                                    Text("  |  ")
                                        .foregroundColor(Color("Vert"))
                                    Text("\(person.weight, specifier: "%.0f")kg")
                                }
                                .padding(10)
                                .background(Color.purpleContent)
                                .cornerRadius(8)
                                .font(.caption)
                                
                                // Niveau de la personne
                                Text("Niveau \(person.level.rawValue)")
                                    .foregroundStyle(.gray)
                                    .font(.subheadline)
                                    .italic()
                            }.padding(.horizontal, 10)
                        }.padding(.horizontal, 10)
                        
                        VStack(alignment: .leading) {
                            // Description de la personne
                            HStack {
                                Text("A propos de moi  ")
                                    .padding(.vertical, 5)
                                    .font(.custom("IntegralCF-MediumOblique", size: 20))
                            }
                            Text(person.describe)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        
                        // Activités favorites de l'utilisateur
                        FavoriteActivitiesView(preferences: preferences, screenWidth: CGFloat(UIScreen.main.bounds.width))
                            .padding(.vertical, 7)
                        
                        // Section des performances
                        VStack(alignment: .leading) {
                            NavigationLink(destination: WorkoutView()) {
                                    // Miniature de WorkoutProgressView
                                    HStack {
                                        Text("PERFORMANCES")
                                            .foregroundColor(.white)
                                            .font(.custom("IntegralCF-RegularOblique", size: 16))
                                        
                                        Spacer()
                                        
                                        ZStack {
                                            ProgressRing(progress: 0.75)
                                                .frame(width: 50, height: 50)
                                            Text("\(Int(0.75 * 100))%")
                                                .foregroundColor(.white)
                                                .font(.caption)
                                        }
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.white)
                                            .padding(.leading, 7)
                                    }
                                    .padding()
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        .background(Color("PurpleContent"))
                        .cornerRadius(10)
                        .padding(.horizontal, 22)
                        .padding(.vertical, 7)
                        
                        // Activités à venir pour l'utilisateur
                        UpcomingActivitiesView(person: personsDataBase[0],
                                               activities: viewModel.activitiesData,
                                               screenWidth: screenWidth,
                                               dateFormatter: dateFormatter,
                                               timeFormatter: timeFormatter
                        )
                        
                        // Activités créées par l'utilisateur
                        CreatedActivitiesView(person: personsDataBase[0],
                                              activities: viewModel.activitiesData.filter{ $0.authorID == personsDataBase[0].id },
                                              screenWidth: screenWidth,
                                              dateFormatter: dateFormatter,
                                              timeFormatter: timeFormatter
                        )
                    }
                }
            }
            .onAppear{
                viewModel.fetchActivity()
            }
            .foregroundColor(.white)
        }
    }
}

#Preview {
    let person = personsDataBase[0]
    let upcomingActivities = activities.filter { $0.personsRecordedIDs.contains(person.id) }
    
    ProfileView(person: person, upcomingActivities: upcomingActivities)
}
