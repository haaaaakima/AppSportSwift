//
//  SessionsView.swift
//  SportConnect
//
//  Created by apprenant106 on 03/03/2025.
//
import SwiftUI

struct SessionsView: View {
    var sessions: [Session] // Liste de sessions

    var body: some View {
        VStack(spacing: 15) { // Espacement entre les cartes de session
            ForEach(sessions) { session in
                HStack {
                    // Image circulaire à gauche
                    Image(session.imageName)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())

                    // Informations sur la session
                    VStack(alignment: .leading) {
                        Text(session.title)
                            .foregroundColor(.white)
                            .font(.headline)
                        Text(session.duration)
                            .foregroundColor(.gray)
                            .font(.caption)
                    }

                    Spacer()

                    // ProgressRings pour la session
                    ProgressRing(progress: 0.75)
                        .frame(width: 30, height: 30)
                }
                .padding()
                .background(Color.black.opacity(0.8))
                .cornerRadius(10)
            }
        }
    }
}

