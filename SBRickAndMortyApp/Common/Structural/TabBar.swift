//
//  TabBar.swift
//  SBRickAndMortyApp
//
//  Created by Sergio Becerril on 25/04/2024.
//

import SwiftUI

struct TabBar: View {
    @State private var isViewPresented = false
    @Binding var darkMode: Bool
    
    var body: some View {
        TabView {
            CharacterView(darkMode: $darkMode)
                .tabItem {
                    Label(Constants.Literals.charactersTab, systemImage: Constants.SystemImage.charactersTab)
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(darkMode: .constant(false))
    }
}
