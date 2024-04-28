//
//  PresetView.swift
//  Dice
//
//  Created by Rory Allen on 3/3/21.
//

import SwiftUI

//struct PresetView: View {
//    @EnvironmentObject var colorScheme: ColorScheme
//    @ObservedObject var preset: PresetRoll
//    
//    let diceTypes = [4,6,8,10,12,20,100]
////    @State private var selectedType: Int = 4
////    @State private var selectedNumber: Int = 1
//    
//    var body: some View {
//        VStack {
//            ZStack{
//                colorScheme.secondary
//                HStack {
//                    Text("Preset Name: ")
//                        .foregroundColor(colorScheme.primary)
//                        .padding()
//                        
//                    Spacer()
//                    TextField("Name", text: $preset.name)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .foregroundColor(colorScheme.primary)
//                        .padding()
//                }
//            }.padding()
//            Spacer()
//            ZStack{
//                colorScheme.secondary
//                HStack {
//                    Text("How many?:      ")
//                        .foregroundColor(colorScheme.primary)
//                        .padding()
//                        
//                    Spacer()
//                    Stepper("\(preset.numberOfDice)", value: $preset.numberOfDice, in: 1...20)
//                        .foregroundColor(colorScheme.primary)
//                        .padding()
//                }
//            }.padding()
//            Spacer()
//            ZStack{
//                colorScheme.secondary
//                HStack {
//                    Text("Dice:")
//                        .foregroundColor(colorScheme.primary)
//                        .padding()
//                        
//                    Spacer()
//                    Picker("", selection: $preset.typeOfDice) {
//                        ForEach(diceTypes, id: \.self){
//                            Text("d\($0)")
//                                .foregroundColor(colorScheme.primary)
//                        }
//                    }.foregroundColor(colorScheme.primary)
//                    .padding()
//                }
//            }.padding()
//            Spacer()
//            ZStack{
//                colorScheme.secondary
//                HStack {
//                    Text("Modifier:       ")
//                        .foregroundColor(colorScheme.primary)
//                        .padding()
//                    Spacer()
//                    Stepper("\(preset.modifier)", value: $preset.modifier, in: -10...10)
//                        .foregroundColor(colorScheme.primary)
//                        .padding()
//                }
//            }.padding()
//            Spacer()
//            Button(action:
//            {
//                UserDefaults.standard.set(preset.name, forKey: "preset\(preset.id)name")
//                UserDefaults.standard.set(preset.numberOfDice, forKey: "preset\(preset.id)number")
//                UserDefaults.standard.set(preset.typeOfDice, forKey: "preset\(preset.id)type")
//            }) {
//                ZStack
//                {
//                    colorScheme.primary
//                    Text("Confirm")
//                        .foregroundColor(colorScheme.secondary)
//                        .padding()
//                }
//            }.padding()
//        }.navigationTitle(preset.name)
//    }
//}
//
//struct PresetView_Previews: PreviewProvider {
//    static var previews: some View {
//        PresetView(preset: PresetRoll(id: 1))
//    }
//}
