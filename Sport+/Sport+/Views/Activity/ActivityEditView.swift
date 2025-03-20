//
//  ActivityEditView.swift
//  Sport+
//
//  Created by Mouhamadou SALL on 07/03/2025.
//

import SwiftUI

struct ActivityEditView: View {
    @State var viewModel : ActivityListViewModel
    
    @Bindable var activity: Activity
    
    @State var lieu: String
    @State var participant: Int
    @State var description: String
    @State var publishDate: Date
    @State var selectedCategory: Sport
    
    init(activity: Activity, viewModel: ActivityListViewModel) {
        self.activity = activity
        self._viewModel = State(wrappedValue: viewModel)
        self._lieu = State(initialValue: activity.cityActivity)
        self._participant = State(initialValue: activity.numberOfParticipant)
        self._description = State(initialValue: activity.activityDescription)
        self._publishDate = State(initialValue: activity.date)
        self._selectedCategory = State(initialValue: activity.sportType)
    }
    
    var backColor: Color = Color("PurpleBackground")
    var body: some View {
        ZStack {
            backColor
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Modifier une activité")
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
                        .colorScheme(.dark)
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
                
                // Boutons (centre)
                VStack(spacing: 16) {
                    // Bouton Modifier
                    Button(action: {
                        activity.sportType = selectedCategory
                        activity.date = publishDate
                        activity.cityActivity = lieu
                        activity.numberOfParticipant = participant
                        activity.activityDescription = description
                        
                        viewModel.updateActivity(activity: activity)
                    }) {
                        Text("MODIFIER")
                            .padding(.vertical, 16)
                            .font(.custom("IntegralCF-BoldOblique", size: 16))
                            .frame(width: 365)
                            .foregroundColor(.black)
                            .background(.vert)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    // Bouton Supprimer
                    Button(action: {
                        viewModel.deleteActivity(activity: activity)
                    }) {
                        Text("SUPPRIMER")
                            .padding(.vertical, 16)
                            .font(.custom("IntegralCF-BoldOblique", size: 16))
                            .frame(width: 365)
                            .foregroundColor(.white)
                            .background(.red)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
            }
            .padding(.vertical, 10)
        }
        // Bouton de retour
        CustomBackButton()
    }
}

#Preview {
    let fakeActivity = Activity(name: "", sportType: .foot, date: Date(), numberOfParticipant: 5, personsRecordedIDs: [], authorID: personsDataBase[0].id, cityActivity: "Lyon", activityDescription: "Je suis la fausse description")
    
    let repo = ActivityListViewModel(activityRepository: ActivityRepository.shared)
    
    ActivityEditView(activity: fakeActivity,
                     viewModel: repo)
}
