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
        static let bundleshortVersion = "Personajes"
        static let bundleVersion = "Personajes"
        static let undefinedValue = "n/d"
        static let settingTestTitle = "Settings"
        static let sectionHeaderSettingTestTitle = "Preferencias generales"
        static let settingDarkMode = "Modo oscuro"
        static let titlePickerLanguage = "Idioma"
        static let spanishLanguage = "Español"
        static let englishLanguage = "Inglés"
        static let sectionHeaderNotifications = "Notificaciones"
        static let isReceivedNotifications = "Recibir notificaciones"
        static let notificationsNumber = "Número de notificaciones"
        static let informationApp = "Información de la aplicación"
        static let otherInformationApp = "Información de la aplicación..."
        static let aboutThis = "Acerca de"
        static let settings = "Ajustes"
        
    }
    
    public struct SystemImage {
        static let settingsButton = "gear"
        static let charactersTab = "person.2"
        static let settingsDarkMode = "moon.fill"
        static let settingsBuildNumber = "iphone.circle"
    }
    
}
