//
//  CharacterModel.swift
//  SBRickAndMortyApp
//
//  Created by Sergio Becerril on 25/04/2024.
//

import Foundation

import Foundation

struct Character: Codable {
    let info: Info
    let results: [Result]
}

struct Info: Codable {
    let count: Int
    let pages: Int
}

struct Result: Codable, Identifiable, Equatable, Hashable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: NameUrl
    let location: NameUrl
    let image: String
    let episode: [String]
    let url: String
    let created: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
    }
}

struct NameUrl: Codable, Equatable {
    let name: String
    let url: String
}

struct DataCharacter {
    var info: Info
}

struct CharacterWithEpisode: Identifiable, Hashable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: String
    let location: String
    let image: String
    let episode: String
    let url: String
    let created: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
    }
}
