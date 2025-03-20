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
            
            VStack{
                // MARK: - TITRE
                Text("ACTIVITE")
                    .font(.custom("IntegralCF-HeavyOblique", size: 24))
                    .foregroundStyle(.white)
                
                // MARK: - TYPE SPORT PICKER
                HStack{
                    Section(header: Text("Category")) {
                        Picker("Select a category", selection: $selectedCategory) {
                            ForEach(Sport.allCases, id: \.self) { category in
                                Text(category.rawValue)
                                    .tag(category)
                            }}
                    }.foregroundStyle(.blue)
                        .background(.white)
                }
                
                //                // MARK: - DATE PICKER
                Section() {
                    DatePicker("Select a date", selection: $publishDate, displayedComponents: [.date, .hourAndMinute])
                }.foregroundStyle(.gray)
                    .background(.white)
                    .padding()
                
                //                MARK: - NUMBER OF PARTICIPANT PICKER
                
                HStack{
                    Picker("Nombre de participant", selection: $participant){
                        ForEach(1...20, id: \.self) {
                            number in
                            Text("\(number)")
                            
                        }
                    }.pickerStyle(WheelPickerStyle())
                        .background(.gray)
                    
                }
                
                
                // MARK: - TEXTFIELD
                TextField("Lieu", text: $lieu)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Description", text: $description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                //MARK: - BUTTON
                
//              MARK: - MODIFIER
                Button(action: {
                    activity.sportType = selectedCategory
                    activity.date = publishDate
                    activity.cityActivity = lieu
                    activity.numberOfParticipant = participant
                    activity.activityDescription = description
                    
                    viewModel.updateActivity(activity: activity)
                }, label:{
                    
                    Text("MODIFIER")
                        .foregroundStyle(.black)
                        .padding()
                        .background(Color.vert)
                        .cornerRadius(14)
                })
                
//                MARK: - SUPPRIMER
                Button(action: {
                    viewModel.deleteActivity(activity: activity)
                }, label: {
                    Text("SUPPRIMER")
                        .foregroundStyle(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(14)
                })
                
                
            }
        }
    }
}

#Preview {
    let fakeActivity = Activity(name: "", sportType: .foot, date: Date(), numberOfParticipant: 5, personsRecordedIDs: [], authorID: personsDataBase[0].id, cityActivity: "Lyon", activityDescription: "Je suis la fausse description")
    
    let repo = ActivityListViewModel(activityRepository: ActivityRepository.shared)
    
    ActivityEditView(activity: fakeActivity,
                     viewModel: repo)
}
