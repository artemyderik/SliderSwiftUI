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
    
    @FocusState private var focusedField: Field?

    enum Field {
        case red, green, blue
    }
    
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea()
                .onTapGesture {
                    focusedField = nil
                }
            VStack {
                ColorisedRectangle(
                    redSliderValue: redSliderValue,
                    greenSliderValue: greenSliderValue,
                    blueSliderValue: blueSliderValue
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
                    .focused($focusedField, equals: .red )
                    
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
                    .focused($focusedField, equals: .green )
                    
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
                    .focused($focusedField, equals: .blue )
                    
                }
                
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        HStack {
                            Button(action: upButtonTapped) {
                                Image(systemName: "chevron.compact.up")
                            }
                            .padding()
                            
                            Button(action: downButtonTapped) {
                                Image(systemName: "chevron.compact.down")
                            }
                            
                            Spacer()
                            
                            Button("Done") {
                                focusedField = nil
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
    
    private func upButtonTapped() {
        switch focusedField {
        case .blue:
            focusedField = .green
        case .green:
            focusedField = .red
        case .red:
            focusedField = .blue
        case .none:
            focusedField = nil
        }
    }

    private func downButtonTapped() {
        switch focusedField {
        case .red:
            focusedField = .green
        case .green:
            focusedField = .blue
        case .blue:
            focusedField = .red
        case .none:
            focusedField = nil
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

