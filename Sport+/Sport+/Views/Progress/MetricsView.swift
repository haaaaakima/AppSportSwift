//
//  MetricsView.swift
//  SportConnect
//
//  Created by apprenant106 on 03/03/2025.
//
import SwiftUI

struct MetricsView: View {
    @State private var caloriesProgress: Double = 0.75 // Progression dynamique pour les calories
    @State private var stepsProgress: Double = 0.5    // Progression dynamique pour les pas

    var body: some View {
        HStack {
            MetricItemView(title: "CALORIES", value: "730", unit: "kCal", showProgressRing: true, progress: $caloriesProgress)
                .frame(maxWidth: .infinity)

            MetricItemView(title: "PAS", value: "230", unit: "", showProgressRing: true, progress: $stepsProgress)
                .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 20)
    }
}

struct MetricItemView: View {
    var title: String
    var value: String
    var unit: String
    var showProgressRing: Bool
    @Binding var progress: Double // Liaison pour rendre l'anneau dynamique

    var body: some View {
        VStack {
            if showProgressRing {
                HStack {
                    Text(title)
                        .foregroundColor(Color(.white))
                        .font(.custom("IntegralCF-MediumOblique", size: 18))
                    Image(systemName: "flame.fill")
                        .foregroundColor(Color(.orange))
                        .font(.title2)
                }

                ZStack {
                    MetricProgressRing(progress: progress) // Anneau dynamique
                        .frame(width: 100, height: 100)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                progress = Double.random(in: 0.0...1.0) // Mise à jour dynamique
                            }
                        }
                    VStack {
                        Text(value)
                            .foregroundColor(.white)
                            .font(.largeTitle)
                        if !unit.isEmpty {
                            Text(unit)
                                .foregroundColor(.white)
                        }
                    }
                }
            } else {
                VStack {
                    Image(systemName: "shoe.2.fill")
                        .foregroundColor(Color(.vert))
                        .font(.title3)
                    Text(value)
                        .foregroundColor(Color(.vert))
                        .font(.largeTitle)
                }
                Text(title)
                    .foregroundColor(Color(.vert))
                    .font(.title3)
                    .bold()
                    .italic()
            }
        }
        .padding()
    }
}


#Preview {
    MetricsView()
        .background(.purpleBackground)
}
