//
//  EpisodesView.swift
//  SBRickAndMortyApp
//
//  Created by Sergio Becerril on 25/04/2024.
//

import SwiftUI

enum CharacterStatus: String {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "Unknown"
}

struct DetailView: View {
    var characterSelected: CharacterWithEpisode
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 10){
                //TODO: implement show image
                VStack (alignment: .leading) {
                    
                    Text(characterSelected.name)
                        .font(.headline)
                        .padding([.top, .leading])
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack(spacing: 5) {
                        Circle()
                            .fill(characterSelected.status == CharacterStatus.dead.rawValue ? Color.red : characterSelected.status == CharacterStatus.alive.rawValue ? Color.green : Color.yellow)
                            .frame(width: 10, height: 10)
                        Text(characterSelected.status)
                        Text("-")
                        Text(characterSelected.species)
                    }
                    .padding(.leading)
                    
                    Text(Constants.Literals.originLabel)
                        .modifier(TitleText())
                    Text(characterSelected.origin)
                        .padding(.leading)
                    
                    Text(Constants.Literals.locationLabel)
                        .modifier(TitleText())
                    Text(characterSelected.location)
                        .padding(.leading)
                    
                    Text(Constants.Literals.seenLabel)
                        .modifier(TitleText())
                    Text(characterSelected.episode)
                        .padding(.leading)
                    
                    Spacer()
                }
                .navigationTitle(characterSelected.name)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(characterSelected: MockUpCharacter.charactersMockUp)
    }
}
