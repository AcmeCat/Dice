//
//  DiceApp.swift
//  Dice
//
//  Created by Rory Allen on 2/11/20.
//

import SwiftUI
import CoreData

@main
struct DiceApp: App {
    
    @StateObject var rollViewModel: RollViewModel = RollViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                RollView()
            }
            .environmentObject(rollViewModel)
            .statusBar(hidden: true)
        }
    }
}
