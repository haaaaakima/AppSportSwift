//
//  ActivityCreateView.swift
//  Sport+
//
//  Created by Mouhamadou SALL on 07/03/2025.
//

import SwiftUI
import SwiftData

struct ActivityCreateView: View {
    @StateObject var viewModel : ActivityListViewModel = ActivityListViewModel(activityRepository: ActivityRepository.shared)
    
    @State var lieu: String = ""
    @State var participant: Int = 1
    @State var description: String = ""
    @State var publishDate: Date = Date()
    
    @State var selectedCategory: Sport = .course
    
    var backColor: Color = Color("PurpleBackground")
    var body: some View {
        ZStack {
            backColor
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Créer une activité")
                    .font(.custom("IntegralCF-MediumOblique", size: 20))
                    .foregroundStyle(.white)
                    .padding(.top, 20)
                    .padding(.horizontal, 16)
                
                Spacer()
                
                // Catégorie
                HStack {
                    Text("Catégorie")
                        .foregroundStyle(.white)
                    Spacer()
                    Picker("Select a category", selection: $selectedCategory) {
                        ForEach(Sport.allCases, id: \.self) { category in
                            Text(category.rawValue)
                                .tag(category)
                        }
                        .foregroundStyle(.vert)
                    }
                    .pickerStyle(MenuPickerStyle())
                    .tint(.white)
                }
                .padding(.horizontal, 16)
                
                // Date de l'activité - améliorer la visibilité
                HStack {
                    DatePicker("Date & heure", selection: $publishDate, displayedComponents: [.date, .hourAndMinute])
                        .tint(.vert)
                        .foregroundStyle(.white)
                        .colorScheme(.dark) // Ceci va rendre le contenu du picker en blanc
                }
                .padding(.horizontal, 16)
                
                // Nombre de participants
                HStack {
                    Text("Nombre de participants")
                        .foregroundStyle(.white)
                    Spacer()
                    Picker("Nombre de participants", selection: $participant){
                        ForEach(1...20, id: \.self) { number in
                            Text("\(number)")
                        }
                        .foregroundStyle(.vert)
                    }
                    .pickerStyle(MenuPickerStyle())
                    .tint(.white)
                }
                .padding(.horizontal, 16)
                
                // Lieu
                TextField("Lieu", text: $lieu)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color("PurpleContent"))
                    .cornerRadius(10)
                    .padding(.horizontal, 16)
                    .preferredColorScheme(.dark)
                
                // Description
                TextField("Description de l'activité", text: $description)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color("PurpleContent"))
                    .cornerRadius(10)
                    .padding(.horizontal, 16)
                    .preferredColorScheme(.dark)
                
                Spacer()
                
                // Bouton Créer (centré)
                HStack {
                    Button(action: {
                        viewModel.addActivity(activity: Activity(name: "", sportType: selectedCategory, date: publishDate, numberOfParticipant: participant, personsRecordedIDs: [], authorID: 1, cityActivity: lieu, activityDescription: description))
                        publishDate = Date()
                        lieu  = ""
                        participant = 1
                        description = ""
                        selectedCategory = .course
                    }) {
                        Text("CREER")
                            .padding(.vertical, 16)
                            .font(.custom("IntegralCF-BoldOblique", size: 16))
                            .frame(width: 365)
                            .foregroundColor(.black)
                            .background(.vert)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
            }
            .padding(.vertical, 10)
        }
    }
}

#Preview {
    ActivityCreateView()
}
