//
//  ColorScheme.swift
//  Dice
//
//  Created by Rory Allen on 5/11/20.
//

import Foundation
import SwiftUI

class ColorScheme: ObservableObject
{
    @Published var primary: Color = Color("greenlandGreen")
    @Published var secondary: Color = Color("beekeeper")
    
    init() {
        if let primary = UserDefaults.standard.string(forKey: "primaryColor"){
            self.primary = Color(primary)
        }
        if let secondary = UserDefaults.standard.string(forKey: "secondaryColor"){
            self.secondary = Color(secondary)
        }
    }
}
