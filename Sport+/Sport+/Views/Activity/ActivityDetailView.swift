//
//  ActivityDetailView.swift
//  Sport+
//
//  Created by Mouhamadou SALL on 07/03/2025.
//

import SwiftUI

struct ActivityDetailView: View {
    @ObservedObject var viewModel : ActivityDetailViewModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            Color.purpleBackground.ignoresSafeArea()
            
            VStack(spacing: 24) {
                Image(viewModel.activity.image)
                    .resizable()
                    .frame(width: 380, height: 250)
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.top)
                VStack(alignment: .leading, spacing: 16) {
                    Text("\(viewModel.activity.sportType.rawValue)")
                        .font(.custom("IntegralCF-RegularOblique", size: 24))
                        .fontWeight(.bold)
                        .textCase(.uppercase)
                        .foregroundStyle(.white)
                    
                    HStack {
                        Text(viewModel.activity.cityActivity)
                            .font(.system(size: 20))
                            .foregroundStyle(.vert)
                        Spacer()
                        Text("Le \(viewModel.activity.date.dateNormal)")
                            .font(.system(size: 15))
                            .foregroundStyle(.gray)
                    }
                    
                    Text(viewModel.activity.activityDescription)
                        .foregroundStyle(.gray)
                    
                    HStack {
                        Text("Participants:")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        
                        Text("(2 amis)")
                            .font(.system(size: 20))
                            .foregroundStyle(.vert)
                    }
                    
                    HStack(spacing: -5) {
                        ForEach(viewModel.personsRecorded) { record in
                            if viewModel.activity.countPersonsRecorded < 5 {
                                NavigationLink(destination: PersonsRecordedView(viewModel: PersonsRecordedViewModel(activity: viewModel.activity))) {
                                    Image(record.image)
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .scaledToFit()
                                        .clipShape(Circle())
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                Button {
                    viewModel.isParticipating.toggle()
                    viewModel.personRecordedToActivity()
                    if viewModel.isParticipating == false {
                        viewModel.personRecordedDeleteToActivity()
                    }
                    
                } label: {
                    Text(viewModel.isParticipating ? "Ne plus participer" : "Participer a l'activite")
                        .padding(.vertical, 16)
                        .font(.custom("IntegralCF-BoldOblique", size: 16))
                        .frame(width: 350)
                        .foregroundStyle(viewModel.isParticipating ? .white : .purpleBackground)
                        .background(viewModel.isParticipating ? .red : .vert)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.bottom, 32)
            }
            .padding(.horizontal)
            
            // Bouton de retour
            CustomBackButton()
        }
    }
}

#Preview {
    ActivityDetailView(viewModel : ActivityDetailViewModel(activity: activities[0]))
}
