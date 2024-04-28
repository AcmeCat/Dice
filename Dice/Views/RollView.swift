//
//  ContentView.swift
//  Dice
//
//  Created by Rory Allen on 2/11/20.
//

import SwiftUI
import AVFoundation


struct RollView: View {
    
    //var width: CGFloat {UIScreen.main.bounds.width}
    var diceDimension: CGFloat {UIScreen.main.bounds.width / 4}
    
    @EnvironmentObject var rollViewModel: RollViewModel
    //@State var selectedDice: Dice
    
    @ObservedObject var colorScheme: ColorScheme = ColorScheme()
    //@ObservedObject var presetRolls: Presets = Presets()
    let sounds: [String] = ["roll1", "roll2", "roll3", "roll4"]
    //@State var selectedDiceIndex: Int = UserDefaults.standard.integer(forKey: "selectedDice")
    
    @State var rolledValue: String = "?"
    @State var showAction: Bool = false
    @State var player: AVAudioPlayer?
    
    let layout = [
        GridItem(.fixed(UIScreen.main.bounds.width / 4)),
        GridItem(.fixed(UIScreen.main.bounds.width / 4)),
        GridItem(.fixed(UIScreen.main.bounds.width / 4))
    ]
    
    var body: some View {
        ZStack {
            colorScheme.primary
                .edgesIgnoringSafeArea(.all)
            VStack {
                LazyVGrid(columns: layout) {
                    ForEach(rollViewModel.currentRoll.dice()) { dice in
                        DiceView(dice: dice, rollingTrigger: $showAction)
                    }
                    .foregroundColor(colorScheme.secondary)
                    .frame(height: diceDimension)
                }
                
                
                Button (action: {
                    rollSound()
                    rolledValue = "\(rollViewModel.currentRoll.roll())"
                    withAnimation(.easeInOut(duration: 1.0)) {
                        showAction.toggle()
                    }
                })
                {
                    Text("Roll")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .frame(width: diceDimension, height: diceDimension / 2)
                .background(RoundedRectangle(cornerRadius: diceDimension / 4)
                                .fill(colorScheme.secondary))
                
                .foregroundColor(colorScheme.primary)
                
                Spacer()
                
                Text("total: \(rolledValue)")
                    .foregroundStyle(.black)
                
//                Picker("Select a dice", selection: rollViewModel.$currentRoll) {
//                    ForEach(rollViewModel.allDice, id: \.id) { dice in
//                        Text(dice.name)
//                    }
//                }
//                .pickerStyle(SegmentedPickerStyle())
//                .background(colorScheme.secondary)
//                .onChange(of: rollViewModel.currentRoll)
//                {_ in
//                    rolledValue = "?"
//                }
//                .padding()
            }
        }
//        .navigationBarItems(
//            trailing:
//                NavigationLink(destination: OptionsView())
//                {
//                    Image("cog")
//                        .resizable()
//                        .renderingMode(.template)
//                        .foregroundColor(colorScheme.secondary)
//                }
//                .frame(width: width/12, height: width/12)
//        )
    }
//    .environmentObject(colorScheme)
//    .environmentObject(presetRolls)
    
    func rollSound () {
        if let url = Bundle.main.path(forResource: sounds[Int.random(in: 0...3)], ofType: "mp3")
        {
            player = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: url))
            player?.play()
        }
    }
}

//struct ContentView_Previews: PreviewProvider
//{
//    static var previews: some View
//    {
//        RollView()
//    }
//}

extension RollView {
    
}

