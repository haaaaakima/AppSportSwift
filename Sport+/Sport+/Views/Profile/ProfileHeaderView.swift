//
//  ProfileHeaderView.swift
//  Sport+
//
//  Created by DevTipsy94 on 11/03/2025.
//

import SwiftUI

struct ProfileHeaderView: View {
    let person: Person
    
    var body: some View {
        HStack(spacing: 15) {
            // Image de profil
            Image(systemName: person.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.green.opacity(0.7), lineWidth: 3)
                )
            
            // VStack avec les infos
            VStack(alignment: .leading) {
                // Afficher les infos de l'utilisateur
                Text(person.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(person.city)
                    .font(.subheadline)
                
                HStack {
                    Text("\(person.age) ans")
                    Text("|")
                    Text("\(String(format: "%.2f", person.height))m")
                    Text("|")
                    Text("\(Int(person.weight))kg")
                }
                .font(.subheadline)
                .foregroundColor(.gray)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}
