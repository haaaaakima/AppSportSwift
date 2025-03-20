//
//  ActivityCardView.swift
//  Sport+
//
//  Created by Mouhamadou SALL on 07/03/2025.
//

import SwiftUI

struct ActivityCardView: View {
    let activity: Activity
    let cardWidth: CGFloat
    
    var personRecorded: [Person] {
        personsDataBase.filter {
            activity.personsRecordedIDs.contains($0.id)
        }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Image d'activité
            Image(activity.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: cardWidth, height: cardWidth * 0.5)
                .cornerRadius(10)
                .clipped()
            
            VStack(spacing: 0) {
                // Participants en haut à droite
                HStack {
                    Spacer()
                    
                    HStack(spacing: -10) {
                        ForEach(personRecorded.prefix(3)) { record in
                            Image(record.image)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 1))
                        }
                        Text("+\(activity.countPersonsRecorded - 3)")
                            .font(.system(size: 10))
                            .fontWeight(.bold)
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.white)
                            .background(.black.opacity(0.7))
                            .clipShape(Circle())
                            .opacity(activity.countPersonsRecorded > 3 ? 1 : 0)
                    }
                    .padding()
                }
                
                Spacer()
                
                // Détails de l'activité en bas avec background gradient
                HStack {
                    VStack(alignment: .leading) {
                        Text(activity.sportType.rawValue)
                            .font(.custom("IntegralCF-RegularOblique", size: 18))
                            .bold()
                            .textCase(.uppercase)
                            .foregroundColor(.white)
                        
                        Text(activity.cityActivity)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    // Date et heure séparées et alignées à droite
                    VStack(alignment: .trailing) {
                        Text(activity.dateString.split(separator: " ").dropLast().joined(separator: " "))
                            .foregroundColor(.white)
                        
                        Text(activity.dateString.split(separator: " ").last ?? "")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                }
                .padding()
                .frame(width: cardWidth)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [.black.opacity(0.8), .clear]),
                        startPoint: .bottom,
                        endPoint: .top
                    )
                )
            }
            .cornerRadius(10)
            .frame(width: cardWidth, height: cardWidth * 0.5)
        }
        .frame(width: cardWidth, height: cardWidth * 0.5)
    }
}

#Preview {
    ActivityCardView(activity: activities[0], cardWidth: 365)
}
