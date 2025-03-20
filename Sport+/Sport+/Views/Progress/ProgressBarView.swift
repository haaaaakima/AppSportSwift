//
//  ProgressBarView.swift
//  Sport+
//
//  Created by DevTipsy94 on 18/03/2025.
//

import SwiftUI

public struct ProgressBarView: View {
    
    @StateObject private var viewModel = ProgressViewModel()
    
    public var body: some View {
        
        // Liste des progrès journaliers avec entraînements
        ForEach($viewModel.weeklyProgress.indices, id: \.self) { index in
            let progress = $viewModel.weeklyProgress[index]
            HStack {
                VStack(alignment: .leading) {
                    Text(progress.day.wrappedValue)
                        .foregroundColor(.white)
                        .font(.subheadline)
                    Text(progress.trainingType.wrappedValue)
                        .foregroundColor(.gray)
                        .font(.caption)
                }
                Spacer()
                
                ProgressRing(progress: progress.progress.wrappedValue)
                    .frame(width: 50, height: 50)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            progress.progress.wrappedValue = Double.random(in: 0.0...1.0)
                        }
                    }
                Text("\(Int(progress.progress.wrappedValue * 100))%")
                    .foregroundColor(.white)
                    .font(.caption)
            }
            .padding()
            .background(.purpleBackground)
            .cornerRadius(10)
        }
    }
}

#Preview {
    ProgressBarView()
}
