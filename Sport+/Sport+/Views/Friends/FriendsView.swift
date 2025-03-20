//
//  FriendsView.swift
//  Sport+
//
//  Created by DevTipsy94 on 12/03/2025.
//

import SwiftUI

struct FriendsView: View {
    @StateObject private var friendshipManager = FriendshipManagerViewModel()
    @State private var searchText = ""
    @State private var showingAddFriendSheet = false
    @Environment(\.presentationMode) var presentationMode
    
    var filteredFriends: [Person] {
        let friends = personsDataBase.filter { friendshipManager.isFriend($0.id) }
        if searchText.isEmpty {
            return friends
        } else {
            return friends.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        ZStack {
            // Couleur de fond de l'écran entier
            Color("PurpleBackground")
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                // Titre
                Text("Ajouter des amis")
                    .font(.custom("IntegralCF-RegularOblique", size: 20))
                    .foregroundColor(.white)
                    .padding(.leading)
                    .padding(.top)
                
                // Barre de recherche et bouton d'ajout
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Rechercher des amis", text: $searchText)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(20)
                    
                    Button {
                        showingAddFriendSheet = true
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30)
                            .background(Color.green)
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                
                // Liste d'amis
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(filteredFriends) { person in
                            VStack {
                                HStack {
                                    // Photo de profil avec point vert
                                    ZStack(alignment: .bottomTrailing) {
                                        Image(person.image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 60, height: 60)
                                            .clipShape(Circle())
                                        
                                        // Point vert (simulé pour certains utilisateurs)
                                        if person.id.hashValue % 3 == 0 { // Simulation de statut en ligne
                                            Circle()
                                                .fill(Color.green)
                                                .frame(width: 14, height: 14)
                                                .overlay(
                                                    Circle()
                                                        .stroke(Color.black, lineWidth: 2)
                                                )
                                        }
                                    }
                                    
                                    // Nom en style italique
                                    Text(person.name.uppercased())
                                        .font(.custom("IntegralCF-RegularOblique", size: 24))
                                        .foregroundColor(.white)
                                        .padding(.leading, 10)
                                    
                                    Spacer()
                                    
                                    // Bouton supprimer
                                    Button {
                                        friendshipManager.removeFriend(person.id)
                                    } label: {
                                        Image(systemName: "minus")
                                            .font(.system(size: 16))
                                            .foregroundColor(.white)
                                            .frame(width: 40, height: 40)
                                            .background(Color.red)
                                            .clipShape(Circle())
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.vertical, 15)
                                
                                Divider()
                                    .background(Color.gray.opacity(0.3))
                                    .padding(.leading, 90)
                            }
                        }
                    }
                }
            }
            
            // Bouton de retour
            CustomBackButton()
        }
        .sheet(isPresented: $showingAddFriendSheet) {
            AddFriendView(friendshipManager: friendshipManager)
        }
    }
}

#Preview {
    FriendsView()
}
