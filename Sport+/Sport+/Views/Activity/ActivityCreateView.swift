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
    
    // A TRAVAILLER
    @State var selectedCategory: Sport = .course
    
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
                
                Button(action: {
                    viewModel.addActivity(activity: Activity(name: "", sportType: selectedCategory, date: publishDate, numberOfParticipant: participant, personsRecordedIDs: [], authorID: 1, cityActivity: lieu, activityDescription: description))
                    
                    // Reset des informations
                    publishDate = Date()
                    lieu  = ""
                    participant = 1
                    description = ""
                    selectedCategory = .course
                    
                }, label:{
                    
                    Text("CREER")
                        .foregroundStyle(.black)
                        .padding()
                        .background(Color.vert)
                        .cornerRadius(14)
                })
                
                Text("ANNULER")
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(14)
                
            }
        }
    }
}

// Voir cette partie aussi
#Preview {
    ActivityCreateView()
}
