//
//  ContentView.swift
//  Sport+
//
//  Created by Mouhamadou SALL on 05/03/2025.
//

import SwiftUI

struct ActivityListView: View {
    @StateObject var viewModel : ActivityListViewModel = ActivityListViewModel(activityRepository: ActivityRepository.shared)
    var body: some View {
        NavigationStack{
            ZStack{
                Color.purpleBackground.ignoresSafeArea()
                // MARK: - La barre de recherche
                ScrollView(.vertical, showsIndicators: false) {
                    
                    ActivitySearchBarView()
                    
                    //MARK: - les filtres par date
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        ActivityFilterView(viewModel: viewModel)
                    }
                    
                    // MARK: - affichage des listes activities
                    
                    VStack(spacing : 24){
                        
                        ForEach(viewModel.filteredActivitiesBySportORByDate.sorted { $0.date < $1.date }) {
                            activity in
                            NavigationLink {
                                ActivityDetailView(viewModel: ActivityDetailViewModel(activity : activity))
                            } label: {
                                ActivityCardView(activity: activity, cardWidth: 365)
                            }
                        }
                    }
                    
                }.padding(.horizontal)
                
            }
            .onAppear {
                if viewModel.activitiesData.isEmpty {
                    viewModel.addSampleExpense()
                }
                    viewModel.fetchActivity()
                }
            }
    }
}

#Preview {
    ActivityListView()
}
