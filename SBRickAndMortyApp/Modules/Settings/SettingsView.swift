//
//  SwiftUIView.swift
//  SBRickAndMortyApp
//
//  Created by Sergio Becerril on 26/04/2024.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isViewPresented: Bool
    @Binding var darkMode: Bool
    
    var version: String {
        if let version = Bundle.main.infoDictionary?[Constants.Literals.bundleshortVersion] as? String {
                return version
            }
            return Constants.Literals.undefinedValue
        }
    
    var buildNumber: String {
            if let buildNumber = Bundle.main.infoDictionary?[Constants.Literals.bundleVersion] as? String {
                return buildNumber
            }
            return Constants.Literals.undefinedValue
        }

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text(Constants.Literals.SettingsLiterals.header)) {
                    HStack {
                        Label(Constants.Literals.SettingsLiterals.darkModeLabel, systemImage: Constants.SystemImage.settingsDarkMode)
                        Toggle("", isOn: $darkMode)
                    }

                    HStack {
                        Label (Constants.Literals.SettingsLiterals.versionLabel, systemImage: Constants.SystemImage.settingsBuildNumber)
                        Spacer()
                        Text("\(version) build \(buildNumber)")
                    }
                }
            }
              
            .navigationTitle(Constants.Literals.settings)
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isViewPresented = false
                    } label: {
                        Image(systemName: Constants.systemImage.xMarkButton)
                    }
                }
            }
            .preferredColorScheme(darkMode ? .dark : .light)
        }
    }
    
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(isViewPresented: .constant(true), darkMode: .constant(false))
    }
}
