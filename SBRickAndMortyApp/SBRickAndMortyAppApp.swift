//
//  SBRickAndMortyAppApp.swift
//  SBRickAndMortyApp
//
//  Created by Sergio Becerril on 25/04/2024.
//

import SwiftUI

@main
struct SBRickAndMortyAppApp: App {
    @State var darkMode: Bool = false
    
    var body: some Scene {
        WindowGroup {
            TabBar(darkMode: $darkMode)
                .preferredColorScheme(darkMode ? .dark : .light)
        }
    }
}
