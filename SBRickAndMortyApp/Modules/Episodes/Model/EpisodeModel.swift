//
//  EpisodeModel.swift
//  SBRickAndMortyApp
//
//  Created by Sergio Becerril on 25/04/2024.
//

import Foundation

struct Episode: Codable {
    let info: InfoEpisode
    let results: [ResultsEpisodes]
}

struct InfoEpisode: Codable {
    let count: Int
    let pages: Int
}

struct ResultsEpisodes: Codable, Identifiable, Hashable, Equatable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, episode, characters, url, created
        case airDate = "air_date"
    }
    
}

struct DataEpisode {
    var info: InfoEpisode
}

struct CharactersForEpisode: Codable, Identifiable, Hashable, Equatable {
    let id: Int
    let name: String
}

struct EpisodeWithCharacter: Identifiable, Equatable, Hashable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [CharactersForEpisode]
    let url: String
    let created: String
}
