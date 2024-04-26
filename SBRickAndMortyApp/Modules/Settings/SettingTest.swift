//
//  SettingTest.swift
//  SBRickAndMortyApp
//
//  Created by Sergio Becerril on 26/04/2024.
//

import SwiftUI

struct SettingTest: View {
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text(Constants.Literals.sectionHeaderSettingTestTitle)) {
                    Toggle(Constants.Literals.settingDarkMode, isOn: .constant(false))
                    Picker(Constants.Literals.titlePickerLanguage, selection: .constant(0)) {
                        Text(Constants.Literals.spanishLanguage).tag(0)
                        Text(Constants.Literals.englishLanguage).tag(1)
                    }
                }

                Section(header: Text(Constants.Literals.sectionHeaderNotifications)) {
                    Toggle(Constants.Literals.isReceivedNotifications, isOn: .constant(true))
                    Stepper(Constants.Literals.notificationsNumber, value: .constant(5), in: 1...10)
                }

                Section(header: Text(Constants.Literals.notificationsNumber)) {
                    NavigationLink(destination: AboutView()) {
                        Text(Constants.Literals.aboutThis)
                    }
                }
            }
            .navigationBarTitle(Constants.Literals.notificationsNumber)
        }
    }
}

struct AboutView: View {
    var body: some View {
        Text(Constants.Literals.otherInformationApp)
            .navigationBarTitle(Constants.Literals.aboutThis)
    }
}

struct SettingTest_Previews: PreviewProvider {
    static var previews: some View {
        SettingTest()
    }
}
