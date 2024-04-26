//
//  CharactersTest.swift
//  SBRickAndMortyAppTests
//
//  Created by Sergio Becerril on 26/04/2024.
//

import XCTest
@testable import SBRickAndMortyApp

class CharactersTest: XCTestCase {
    
    var sut: NetworkManager?
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
        
        sut = NetworkManager()
    }
    
    override func tearDownWithError() throws {
        
        //sut = nil
        
        try super.tearDownWithError()
    }
    
    func testAllCharactersEndpoint() {
        
        // Given
        let character = "character/"
        let page = 2
        
        // When
        let response = sut!.getAllCharactersEndpoint(page: page)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.url?.absoluteString.first, "https://rickandmortyapi.com/api/\(character)")
    }
    
    func testCharacterDetailEndpoint() {
        
        // Given
        let character = "character/"
        let id = 1
        
        // When
        let response = sut!.getCharacterDetailEndpoint(id: id)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.url?.absoluteString.split(separator: "?").first, "https://rickandmortyapi.com/api/\(character)\(id)")
    }
    
}
