//
//  PersonsRecordedView.swift
//  Sport+
//
//  Created by Mouhamadou SALL on 12/03/2025.
//

import SwiftUI

struct PersonsRecordedView: View {
    
    @ObservedObject var viewModel : PersonsRecordedViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color(.purpleBackground).ignoresSafeArea()
                
                ScrollView(.vertical) {
                    VStack( spacing: 24){
                        ForEach(viewModel.personsRecorded) { eachPersonRecorder in
                                HStack {
                                Image(eachPersonRecorder.image)
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                    .scaledToFit()
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.vert, lineWidth: 2))
                                VStack(alignment: .leading) {
                                    Text(eachPersonRecorder.name)
                                        .font(.system(size: 20))
                                        .fontWeight(.bold)
                                        .foregroundStyle(.white)
                                    
                                    Text(eachPersonRecorder.level.rawValue)
                                        .padding(.top, 1)
                                        .font(.system(size: 12))
                                        .textCase(.uppercase)
                                        .foregroundStyle(.vert)
                                    Rectangle()
                                        .frame(width: 250, height: 1)
                                        .foregroundStyle(.white)
                                        .padding(.top, 5)
                                }.padding(.leading, 10 )
                            }
                        }
                    }
                }
                
            }
            CustomBackButton()
        }
    }
}

#Preview {
    PersonsRecordedView(viewModel: PersonsRecordedViewModel(activity: activities[0]))
}
