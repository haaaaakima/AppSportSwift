//
//  WorkoutView.swift
//  SportConnect
//
//  Created by apprenant106 on 03/03/2025.
//
import SwiftUI

struct WorkoutView: View {
    @StateObject private var viewModel = ProgressViewModel()

    var body: some View {
        ZStack {
            Color(.purpleBackground).edgesIgnoringSafeArea(.all)

            ScrollView {
                VStack(spacing: 20) {
                    WorkoutProgressView()
                    MetricsView()

                    // Section pour les 7 derniers jours
                    Text("Progression sur 7 jours")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding(.top)

                        ProgressBarView()
                    }
                }
                .padding()
            }
        }
    }

#Preview {
    WorkoutView()
}
