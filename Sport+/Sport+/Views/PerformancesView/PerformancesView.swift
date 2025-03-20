//
//  PerformancesView.swift
//  Sport+
//
//  Created by DevTipsy94 on 12/03/2025.
//

import SwiftUI

public struct PerformancesView: View {
    public var body: some View {
        ZStack {
            // Couleur de fond de l'écran entier
            Color("PurpleBackground")
                .ignoresSafeArea()
         
            VStack {
                Text("PerformancesView")
                    .font(.body)
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    PerformancesView()
}
