//
//  Dice.swift
//  Dice
//
//  Created by Rory Allen on 27/4/2024.
//

import Foundation

struct Dice: Identifiable, Hashable, Rollable, Codable {
    
    var id: String
    let value: Int
    
    init(id: String = UUID().uuidString, value: Int) {
        self.id = id
        self.value = value
    }
    
    func name() -> String { "d\(value)"}
    func roll() -> Int {Int.random(in: 1...value)}
    func dice() -> [Dice] { [self] }
}
