//
//  CharacterImage.swift
//  SBRickAndMortyApp
//
//  Created by Sergio Becerril on 25/04/2024.
//

import Foundation
import CoreGraphics
import SwiftUI

struct CharacterImage: ViewModifier {
    var radius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .cornerRadius(radius)
    }
}
