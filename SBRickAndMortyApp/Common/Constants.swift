//
//  Constants.swift
//  SBRickAndMortyApp
//
//  Created by Sergio Becerril on 25/04/2024.
//

import Foundation

public struct Constants {
    
    struct BaseURL {
        static let url = "https://rickandmortyapi.com/api/"
        
    }
    
    struct EndPoint {
        static let characters = "character?page="
        static let character = "character"
        static let episodes = "episode?page="
        static let imgSettings = "character/avatar/"
        static let episode = "episode/"
        
    }
    
    public struct Literals {
        static let charactersTitle = "Personajes"
        static let originLabel = "Origen"
        static let locationLabel = "Última localización conocida"
        static let seenLabel = "Visto por primera vez"
        static let charactersTab = "Personajes"
    }
    
    public struct SystemImage {
        static let settingsButton = "gear"
        static let charactersTab = "person.2"
    }
    
}
