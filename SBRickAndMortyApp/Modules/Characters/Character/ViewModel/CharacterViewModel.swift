//
//  CharacterViewModel.swift
//  SBRickAndMortyApp
//
//  Created by Sergio Becerril on 25/04/2024.
//

import Foundation
import SwiftUI
import Combine

class CharacterViewModel: ObservableObject {
    //TODO: Create ManagerConnection and add instance
    var characters: [CharacterWithEpisode] = []
    var dataCharacter: DataCharacter?
    var subscribers = Set<AnyCancellable>()
    
    func getCharacters(page: Int) {
        bindManagerConnections()
        //TODO: use instance ManagerConnection and get characters
    }
    
    private func bindManagerConnections() {
        //TODO: use instance ManagerConnection and bind connections
    }
}
