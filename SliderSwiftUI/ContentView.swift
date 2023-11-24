//
//  ContentView.swift
//  SliderSwiftUI
//
//  Created by Артемий Дериглазов on 14.11.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    @FocusState private var isRedFieldFocused: Bool
    @FocusState private var isGreenFieldFocused: Bool
    @FocusState private var isBlueFieldFocused: Bool

    var body: some View {
        VStack {
            Rectangle()
                .frame(height: UIScreen.main.bounds.height / 3.5)
                .cornerRadius(50)
                .foregroundColor(
                    Color(
                        red: redSliderValue / 255,
                        green: greenSliderValue / 255,
                        blue: blueSliderValue / 255)
                )
            VStack {
                GradientSlider(
                    value: $redSliderValue,
                    gradientColors: [
                        Color(
                            red: 0,
                            green: greenSliderValue / 255,
                            blue: blueSliderValue / 255
                        ),
                        Color(
                            red: 1,
                            green: greenSliderValue / 255,
                            blue: blueSliderValue / 255
                        )
                    ],
                    chosenColor: .red
                )
                .onTapGesture {
                    isRedFieldFocused = true
                    isGreenFieldFocused = false
                    isBlueFieldFocused = false
                }
                .focused($isRedFieldFocused)
                
                GradientSlider(
                    value: $greenSliderValue,
                    gradientColors: [
                        Color(
                            red: redSliderValue / 255,
                            green: 0,
                            blue: blueSliderValue / 255
                        ),
                        Color(
                            red: redSliderValue / 255,
                            green: 1,
                            blue: blueSliderValue / 255
                        )
                    ],
                    chosenColor: .green
                )
                .onTapGesture {
                    isRedFieldFocused = false
                    isGreenFieldFocused = true
                    isBlueFieldFocused = false
                }
                .focused($isGreenFieldFocused)

                GradientSlider(
                    value: $blueSliderValue,
                    gradientColors: [
                        Color(
                            red: redSliderValue / 255,
                            green: greenSliderValue / 255,
                            blue: 0
                        ),
                        Color(
                            red: redSliderValue / 255,
                            green: greenSliderValue / 255,
                            blue: 1
                        )
                    ],
                    chosenColor: .blue
                )
                .onTapGesture {
                    isRedFieldFocused = false
                    isGreenFieldFocused = false
                    isBlueFieldFocused = true
                }
                .focused($isBlueFieldFocused)

            }
            
                .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            HStack {
                                Button(action: {
                                    if isBlueFieldFocused {
                                        isBlueFieldFocused = false
                                        isGreenFieldFocused = true
                                    } else {
                                        isGreenFieldFocused = false
                                        isRedFieldFocused = true
                                    }
                                }) {
                                    Image(systemName: "chevron.compact.up")
                                }
                                .padding()
                                
                                Button(action: {
                                    if isRedFieldFocused {
                                        isRedFieldFocused = false
                                        isGreenFieldFocused = true
                                    } else {
                                        isGreenFieldFocused = false
                                        isBlueFieldFocused = true
                                    }
                                })
                                {
                                    Image(systemName: "chevron.compact.down")
                                }
                                
                                Spacer()
                                    
                            Button("Done") {
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                print("Clicked")
                            }
                        }
                    }
                }
            
            Spacer()
        }
        
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
