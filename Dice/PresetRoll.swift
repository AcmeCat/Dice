//
//  PresetRoll.swift
//  Dice
//
//  Created by Rory Allen on 3/3/21.
//

import Foundation
import SwiftUI

struct PresetRoll: Identifiable, Codable, Rollable {
    
    let id: String
    let name: String
    let image: String
    let numberOfDice: Int
    let typeOfDice: Int
    let modifier: Int
    let description: String
    
    init(id: String = UUID().uuidString,
         name: String,
         image: String,
         numberOfDice: Int,
         typeOfDice: Int,
         modifier: Int,
         description: String) {
        
        self.id = id
        self.name = name
        self.image = image
        self.numberOfDice = numberOfDice
        self.typeOfDice = typeOfDice
        self.modifier = modifier
        self.description = description
        
//        if let name = UserDefaults.standard.string(forKey: "preset\(id)name"){
//            self.name = name
//        } else {
//            self.name = "Preset\(id)"
//        }
//        let defaultNumber = UserDefaults.standard.integer(forKey: "preset\(id)number")
//        self.numberOfDice = defaultNumber > 0 ? defaultNumber : 1
//        let defaultType = UserDefaults.standard.integer(forKey: "preset\(id)type")
//        self.typeOfDice = defaultType > 0 ? defaultType : 20
//        self.modifier = UserDefaults.standard.integer(forKey: "preset\(id)modifier")
    }
    
    func roll() -> Int {
        return dice().reduce(0) { $0 + $1.roll() } + modifier
    }
    
    func dice() -> [Dice] {
        var diceArray: [Dice] = []
        for _ in 1...numberOfDice {
            diceArray.append(Dice(value: typeOfDice))
        }
        return diceArray
    }
}
