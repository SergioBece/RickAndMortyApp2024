//
//  EpisodesView.swift
//  SBRickAndMortyApp
//
//  Created by Sergio Becerril on 25/04/2024.
//

import SwiftUI

struct EpisodesView: View {
    @State private var isViewPresented = false
    //TODO: Create Episodes view model and create instance
    @State var currentPage: Int = 1
    @Binding var darkMode: Bool
    @State var isExpanded: Bool = false
    
    var body: some View {
        NavigationView {
            //TODO: call viewmodel and show episodes
        }
        //TODO: Implement Task for get Characters
    }
}

struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesView(darkMode: .constant(false))
    }
}
