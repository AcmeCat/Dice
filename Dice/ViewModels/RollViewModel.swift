//
//  RollViewModel.swift
//  Dice
//
//  Created by Rory Allen on 27/4/2024.
//

import Foundation

protocol Rollable {
    
    func roll() -> Int
    
    func dice() -> [Dice]
}

class RollViewModel: ObservableObject {
    
    let presetsKey: String = "presets"
    let colorsKey: String = "colors"
    
    @Published var presetRolls: [PresetRoll] = []
    
    @Published var currentRoll: Rollable = PresetRoll(name: "thingo", image: "none", numberOfDice: 5, typeOfDice: 12, modifier: 3, description: "A description")
    
    let allDice: [Dice] = [Dice(value: 4), Dice(value: 6), Dice(value: 8), Dice(value: 10), Dice(value: 12), Dice(value: 20), Dice(value: 100)]
}
