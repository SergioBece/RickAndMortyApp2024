//
//  NetworkManager.swift
//  SBRickAndMortyApp
//
//  Created by Sergio Becerril on 26/04/2024.
//

import Foundation
import SwiftUI
import Combine

enum DefinedError: String, Error {
    case networkError = "Network error"
    case parsingError = "The data received could not be processed"
    case apiError = "The session is invalid. Check the API key"
    case Unknown = "Unknown error"
}

final class ManagerConnections: ObservableObject {
    
    @Published var dataCharacter: DataCharacter = DataCharacter(info: Info(count: 0, pages: 0))
    @Published var characters: [CharacterWithEpisode] = []
    @Published var episode: EpisodeWithCharacter = EpisodeWithCharacter(id: 0, name: "", airDate: "", episode: "", characters: [], url: "", created: "")
    @Published var episodesList: [ResultsEpisodes] = []
    @Published var dataEpisode: DataEpisode = DataEpisode(info: InfoEpisode(count: 0, pages: 0))
    
    
    var subscribers = Set<AnyCancellable>()
    
    deinit {
        subscribers.removeAll()
    }
    
    /// Method to get the characters by paging through each of the JSON pages
    func getCharacters(page: Int) {
        let urlString = Constants.BaseURL.url+Constants.EndPoint.characters + "\(page)"
        guard let url = URL(string: urlString) else {
            print ("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        let characterPublisher = URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { (data, response) -> Data in
                if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    return data
                } else {
                    print (DefinedError.networkError.rawValue)
                    throw DefinedError.networkError
                }
            }
            .decode(type: Character.self, decoder: JSONDecoder())
            .share()
            .eraseToAnyPublisher()
        
        let episodesCharactersPublisher = characterPublisher
            .map { $0.results }
            .flatMap { characters in
                Publishers.MergeMany(characters.map { character in
                    self.getEpisodeCharacterPublisher(url: character.episode[0])
                })
            }
        
        Publishers.Zip(characterPublisher, episodesCharactersPublisher)
            .sink { completion in
                if case .failure(let error) = completion {
                    print ("Something has gone wrong in the Character Zip \(error.localizedDescription)")
                }
            } receiveValue: { characters, episode in
                self.dataCharacter.info = characters.info
                characters.results.forEach { character in
                    self.characters.append(CharacterWithEpisode(id: character.id,
                                                                name: character.name,
                                                                status: character.status,
                                                                species: character.species, type: character.type, gender: character.gender,
                                                                origin: character.origin.name,
                                                                location: character.location.name,
                                                                image: character.image,
                                                                episode: episode, url: character.url, created: character.created))
                }
            }
            .store(in: &subscribers)
        
    }
    
    
    func getEpisodeCharacterPublisher(url: String) -> AnyPublisher<String, Error> {
        
        let url = URL(string: url)!
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    return data
                } else {
                    print (DefinedError.networkError.rawValue)
                    throw DefinedError.networkError
                }
            }
            .decode(type: ResultsEpisodes.self, decoder: JSONDecoder())
            .map { $0.name }
            .eraseToAnyPublisher()
    }
    
    
    //MARK: - Methods to recover episodes. getEpisodes(pages: Int) returns the list of episodes. getEpisode(id: Int) gets us a specific episode and the names of its characters
    
    func getEpisodes(page: Int) {
        
        let urlString = Constants.EndPoint.episodes + "\(page)"
        guard let url = URL(string: urlString) else {
            print ("Invalid URL")
            return
        }
        
        URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    return data
                } else {
                    print (DefinedError.networkError.rawValue)
                    throw DefinedError.networkError
                }
            }
            .decode(type: Episode.self, decoder: JSONDecoder())
            .sink { completion in
                if case .failure(let error) = completion {
                    print ("Something went wrong in the zip: \(error.localizedDescription)")
                }
            } receiveValue: { episode in
                self.dataEpisode.info = episode.info
                self.episodesList.append(contentsOf: episode.results)
            }
            .store(in: &subscribers)
    }
    
}
