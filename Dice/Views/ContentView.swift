//
//  ContentView.swift
//  Dice
//
//  Created by Rory Allen on 2/11/20.
//

import SwiftUI
import AVFoundation


struct ContentView: View
{
    struct Dice: Identifiable, Hashable
    {
        var id: Int //dice id'ed by the number of sides
        
        var name: String {"d\(id)"}
        
        var roll: Int {Int.random(in: 1...id)}
    }
    
    @ObservedObject var colorScheme: ColorScheme = ColorScheme()
    @ObservedObject var presetRolls: Presets = Presets()
    let allDice: [Dice] = [Dice(id: 4), Dice(id: 6), Dice(id: 8), Dice(id: 10), Dice(id: 12), Dice(id: 20), Dice(id: 100)]
    let sounds: [String] = ["roll1", "roll2", "roll3", "roll4"]
    @State var selectedDiceIndex: Int = UserDefaults.standard.integer(forKey: "selectedDice")
    @State var rolledValue: String = "?"
    @State var showAction: Bool = false
    @State var player: AVAudioPlayer?
    
    var body: some View
    {
        NavigationView
        {
            ZStack
            {
                colorScheme.primary
                    .edgesIgnoringSafeArea(.all)
                VStack
                {
                    ZStack
                    {
                        Image (allDice[selectedDiceIndex].name)
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: width, height: width, alignment: .center)
                            .foregroundColor(colorScheme.secondary)
                        Text(rolledValue)
                            .font(Font.custom("HelveticaNeue-UltraLight", size: 50))
                            .fontWeight(.heavy)
                            .foregroundColor(colorScheme.secondary)
                    }
                    .rotationEffect(.degrees(self.showAction ? 720.0 : -720.0))
                    .animation(Animation.easeOut(duration: 1.0))
                    
                    Button (action: {
                        rollSound()
                        rolledValue = "\(allDice[selectedDiceIndex].roll)"
                        showAction.toggle()
                    })
                    {
                        Text("Roll")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                    .frame(width: width/3, height: width/6)
                    .background(RoundedRectangle(cornerRadius: width/18)
                                    .fill(colorScheme.secondary))
                    
                    .foregroundColor(colorScheme.primary)
                    
                    Spacer()
                    
                    Picker(selection: $selectedDiceIndex, label: Text("Select Dice"))
                    {
                        ForEach (0..<allDice.count)
                        { index in
                            Text(allDice[index].name)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .background(colorScheme.secondary)
                    .onChange(of: selectedDiceIndex)
                    {_ in
                        rolledValue = "?"
                        UserDefaults.standard.set(selectedDiceIndex, forKey: "selectedDice")
                    }
                    .padding()
                }
            }
            .navigationBarItems(
                trailing:
                    NavigationLink(destination: OptionsView())
                    {
                        Image("cog")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(colorScheme.secondary)
                    }
                    .frame(width: width/12, height: width/12)
            )
        }
        .environmentObject(colorScheme)
        .environmentObject(presetRolls)
    }
    
    var width: CGFloat {UIScreen.main.bounds.width}
    
    func rollSound () {
        if let url = Bundle.main.path(forResource: sounds[Int.random(in: 0...3)], ofType: "mp3")
        {
            player = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: url))
            player?.play()
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}

