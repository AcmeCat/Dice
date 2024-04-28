//
//  DiceView.swift
//  Dice
//
//  Created by Rory Allen on 28/4/2024.
//

import SwiftUI

struct DiceView: View {
    
    let dice: Dice
    let color: Color = Color.primary
    
    @Binding var rollingTrigger: Bool
    @State private var rollValue: Int?
    
    var body: some View {
        ZStack {
            Image (dice.name())
                .renderingMode(.template)
                .resizable()
            Text(rollValue != nil ? rollValue!.description : "?")
                .font(Font.custom("HelveticaNeue-UltraLight", size: 50))
                .fontWeight(.heavy)
        }
        .rotationEffect(.degrees(rollingTrigger ? 720.0 : -720.0))
        .onChange(of: rollingTrigger) { new in
            rollValue = dice.roll()
        }
    }
}

//#Preview {
//    DiceView(dice: Dice(value: 6), rollingTrigger: Binding<Bool>)
//}

