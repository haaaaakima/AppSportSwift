//
//  ActivityFilterView.swift
//  Sport+
//
//  Created by Mouhamadou SALL on 05/03/2025.
//

import SwiftUI
struct ActivityFilterView: View {
    @StateObject
    
    var viewModel : ActivityListViewModel = ActivityListViewModel(activityRepository: ActivityRepository.shared)
    
    var body: some View {

                    //MARK: - les filtres par date
                    
                    ScrollView(.horizontal) {
                        HStack {
                            Button{
                                viewModel.selectedDate = nil
                            } label: {
                                VStack{
                                    Text("ALL")
                                        .font(.custom("IntegralCF-Regular", size: 18))
                                        .fontWeight(.bold)
                                        
                                    Text("-")
                                        .font(.system(size: 15))
                                        .fontWeight(.bold)
                                }
                                .padding(10)
                                .foregroundStyle(viewModel.selectedDate == nil ? .purpleContent : .white )
                                .background(viewModel.selectedDate == nil ? .vert : .purpleContent)
                                .cornerRadius(10)
                                .padding(.bottom, 22)
                            }
                            ForEach(viewModel.genererDates(), id: \.self) { eachDate in
                                
                                Button {
                                    viewModel.selectedDate = eachDate

                                } label: {
                                    VStack{
                                        Text("\(eachDate.day)")
                                            .font(.custom("IntegralCF-Regular" ,size: 18))
                                            .fontWeight(.bold)
                                        Text("\((eachDate.month).prefix(3))")
                                            .font(.system(size: 15))
                                            .fontWeight(.bold)
                                    }
                                    .padding(10)
                                    .textCase(.uppercase)
                                    .foregroundStyle(viewModel.selectedDate  == eachDate ?
                                                     .purpleContent :
                                                        .white)
                                    .background(viewModel.selectedDate   == eachDate ?
                                        .vert  : .purpleContent
                                    )
                                    .cornerRadius(10)
                                }.padding(.bottom, 24)
                            }
                            
                        }
                    }
    }
}

#Preview {
    ActivityFilterView()
}
