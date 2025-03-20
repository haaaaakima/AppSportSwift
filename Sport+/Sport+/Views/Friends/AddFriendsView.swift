//
//  AddFriendsView.swift
//  Sport+
//
//  Created by DevTipsy94 on 17/03/2025.
//
import SwiftUI

struct AddFriendView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var friendshipManager: FriendshipManagerViewModel
    @State private var searchText = ""
    
    var filteredPersons: [Person] {
        if searchText.isEmpty {
            return personsDataBase.filter { !friendshipManager.isFriend($0.id) }
        } else {
            return personsDataBase.filter {
                !friendshipManager.isFriend($0.id) &&
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                // Couleur de fond de l'écran entier
                Color("PurpleBackground")
                    .ignoresSafeArea()
                
                VStack {
                    // Barre de recherche
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Rechercher des personnes", text: $searchText)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(20)
                    .padding()
                    
                    // Liste de personnes à ajouter
                    List {
                        ForEach(filteredPersons) { person in
                            HStack {
                                Image(person.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                
                                Text(person.name)
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                Button {
                                    friendshipManager.addFriend(person.id)
                                } label: {
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                        .frame(width: 30, height: 30)
                                        .background(Color.green)
                                        .clipShape(Circle())
                                }
                            }
                            .listRowBackground(Color("PurpleBackground"))
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Ajouter des amis")
            .foregroundColor(.white)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Annuler") {
                        dismiss()
                    }
                    .foregroundColor(.white)
                }
            }
        }
    }
}
