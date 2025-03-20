//
//  ActivitySearchBarView.swift
//  Sport+
//
//  Created by DevTipsy94 on 14/03/2025.
//

import SwiftUI

struct ActivitySearchBarView: View {
    @StateObject var viewModel : ActivityListViewModel = ActivityListViewModel(activityRepository: ActivityRepository.shared)
    public var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 15, height: 15)
                .foregroundStyle(.searchBar)
            TextField("", text: $viewModel.searchBySport, prompt: Text("Rechercher un sport").foregroundStyle(.searchBar))
        }
        .padding(10)
        .foregroundStyle(.white)
        .background(Color.purpleContent)
        .cornerRadius(10)
        .padding(.bottom , 24)
    }
}

#Preview {
    ActivitySearchBarView(viewModel: ActivityListViewModel(activityRepository: ActivityRepository.shared))
}
