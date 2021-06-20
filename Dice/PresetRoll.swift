//
//  PresetRoll.swift
//  Dice
//
//  Created by Rory Allen on 3/3/21.
//

import Foundation
import SwiftUI

class PresetRoll: ObservableObject, Identifiable
{
    @Published var id: Int = 1
    @Published var name: String = "Preset1"
    @Published var numberOfDice: Int = 1
    @Published var typeOfDice: Int = 0
    @Published var modifier: Int = 0
    
    init(id: Int) {
        self.id = id
        if let name = UserDefaults.standard.string(forKey: "preset\(id)name"){
            self.name = name
        } else {
            self.name = "Preset\(id)"
        }
        let defaultNumber = UserDefaults.standard.integer(forKey: "preset\(id)number")
        self.numberOfDice = defaultNumber > 0 ? defaultNumber : 1
        let defaultType = UserDefaults.standard.integer(forKey: "preset\(id)type")
        self.typeOfDice = defaultType > 0 ? defaultType : 20
        self.modifier = UserDefaults.standard.integer(forKey: "preset\(id)modifier")
    }
}
