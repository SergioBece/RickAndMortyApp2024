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
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: guides) {
                    ForEach(viewModel.characters) { character in
                        NavigationLink(value: character) {
                            ZStack(alignment: .bottomLeading) {
                                AsyncImage(url: URL(string: character.image), content: { image in
                                    image
                                        .resizable()
                                        .modifier(CharacterImage(radius: 10))
                                }, placeholder: {
                                    Image(.clock)
                                        .resizable()
                                        .modifier(CharacterImage(radius: 10))
                                })
                                
                                Text(character.name)
                                    .foregroundStyle(.white)
                                    .font(.caption)
                                    .padding(5)
                                    .background(Color.black.opacity(0.7))
                                    .cornerRadius(8)
                                    .padding(3)
                            }
                        }
                        .onAppear {
                            // Detectar cuándo se acerca el final de la lista para recargar la siguiente página
                            if character == viewModel.characters.last {
                                currentPage += 1
                                guard let totalPages = viewModel.dataCharacter?.info.pages else { return }
                                if currentPage <= totalPages {
                                    viewModel.getCharacters(page: currentPage)
                                }
                            }
                        }
                    }
                }
                
                .task {
                    viewModel.getCharacters(page: currentPage)
                }
                
            }
            .navigationDestination(for: CharacterWithEpisode.self, destination: { characterSelected in
                DetailView(characterSelected: characterSelected)
            })
            .navigationTitle(Constants.Literals.charactersTitle)
            .toolbar {
                ToolbarItemGroup(placement: .primaryAction) {
                    Button(action: {
                        isViewPresented = true
                    }, label: {
                        Image(systemName: Constants.systemImage.settingsButton)
                    })
                }
            }
            .sheet(isPresented: $isViewPresented, content: {
                SettingsView(isViewPresented: $isViewPresented, darkMode: $darkMode)
                    .presentationDetents([.medium])
            })
        }
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(darkMode: .constant(false))
    }
}
