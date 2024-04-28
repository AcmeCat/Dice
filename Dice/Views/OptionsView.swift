//
//  ColorView.swift
//  Dice
//
//  Created by Rory Allen on 5/11/20.
//

import SwiftUI

//struct OptionsView: View
//{
//    @EnvironmentObject var colorScheme: ColorScheme
//    
//    let colors: [String] = ["beekeeper", "turbo", "greenlandGreen", "middleBlue", "spicedNectarine", "quinceJelly", "heliotrope", "steelPink"]
//    
//    @EnvironmentObject var presetRolls: Presets
//
//    var body: some View
//    {
//        VStack
//        {
//            ForEach(presetRolls.presets){
//                preset in
//                NavigationLink(destination: PresetView(preset: preset))
//                {
//                    ZStack
//                    {
//                        colorScheme.secondary
//                        Text(preset.name + ": \(preset.numberOfDice)d\(preset.typeOfDice) \(modifierToString(preset.modifier))")
//                            .foregroundColor(colorScheme.primary)
//                    }
//                }
//            }
//            
//            Text("Primary")
//                .padding()
//                .font(.largeTitle)
//                .foregroundColor(colorScheme.primary)
//            HStack
//            {
//                ForEach (0..<colors.count, id: \.self)
//                { color in
//                    Button(action:
//                    {
//                        colorScheme.primary = Color(colors[color])
//                        UserDefaults.standard.set(colors[color], forKey: "primaryColor")
//                    }) {
//                        Color(colors[color])
//                    }
//                }
//                .frame(width: width(), height: width())
//                .cornerRadius(width()/4)
//            }
//            Text("Secondary").padding()
//                    .padding()
//                    .font(.largeTitle)
//                    .foregroundColor(colorScheme.secondary)
//            HStack
//            {
//                ForEach (0..<colors.count, id: \.self)
//                { color in
//                    Button(action:
//                    {
//                        colorScheme.secondary = Color(colors[color])
//                        UserDefaults.standard.set(colors[color], forKey: "secondaryColor")
//                    }) {
//                        Color(colors[color])
//                    }
//                    
//                }
//                .frame(width: width(), height: width())
//                .cornerRadius(width()/4)
//            }
//        }
//        .navigationTitle("Options")
//    }
//    
//    func width () -> CGFloat
//    {
//        (UIScreen.main.bounds.width / 8) - 10
//    }
//    
//    func modifierToString (_ mod: Int) -> String {
//        var str = ""
//        if mod < 0 {
//            str += "\(mod)"
//        }
//        if mod > 0 {
//            str += "+\(mod)"
//        }
//        return str
//    }
//}
//
//struct ColorView_Previews: PreviewProvider {
//    static var previews: some View {
//        OptionsView()
//    }
//}
