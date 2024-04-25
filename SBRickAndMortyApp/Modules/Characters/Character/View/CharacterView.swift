//
//  CharacterView.swift
//  SBRickAndMortyApp
//
//  Created by Sergio Becerril on 25/04/2024.
//

import SwiftUI

struct CharacterView: View {
    @State private var isViewPresented = false
    @State var viewModel = CharacterViewModel()
    @State private var currentPage = 1
    @Binding var darkMode: Bool
    
    let guides = [
        GridItem(.flexible(minimum: 75), alignment: .top),
        GridItem(.flexible(minimum: 75), alignment: .top),
        GridItem(.flexible(minimum: 75), alignment: .top)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: guides) {
                    ForEach(viewModel.characters) { character in
                        //TODO: Implement View
                    }
                }
                //TODO: Implement Task for get Characters
            }
            //TODO: Navigate to DetailView
            .navigationTitle("Personajes")
            .toolbar {
                ToolbarItemGroup(placement: .primaryAction) {
                    Button(action: {
                        isViewPresented = true
                    }, label: {
                        Image(systemName: "gear")
                    })
                }
            }
            .sheet(isPresented: $isViewPresented, content: {
                //TODO: Navigate to Settings View
            })
        }
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(darkMode: .constant(false))
    }
}
