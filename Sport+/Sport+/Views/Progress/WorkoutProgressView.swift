//
//  WorkoutProgressView.swift
//  SportConnect
//
//  Created by apprenant106 on 03/03/2025.
//

import SwiftUI

struct WorkoutProgressView: View {
    @State private var progress: Double = 0.75 // Progression initiale

    var body: some View {
        VStack {
            HStack {
                Text("PERFORMANCES")
                    .foregroundColor(.white)
                    .font(.custom("IntegralCF-RegularOblique", size: 22))
                
                Spacer()
                
                ZStack {
                    ProgressRing(progress: progress)
                        .frame(width: 60, height: 60)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                progress = Double.random(in: 0.0...1.0) // Mise à jour aléatoire
                            }
                        }
                    Text("\(Int(progress * 100))%")
                        .foregroundColor(.white)
                        .font(.headline)
                }
        }
            .padding()
            .background(.purpleBackground)
        }
        CustomBackButton()
    }
}

#Preview {
    WorkoutProgressView()
}
