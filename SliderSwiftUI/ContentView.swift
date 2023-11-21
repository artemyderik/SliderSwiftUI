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
                        Color(red: 0, green: greenSliderValue / 255, blue: blueSliderValue / 255),
                        Color(red: 1, green: greenSliderValue / 255, blue: blueSliderValue / 255)
                    ], chosenColor: .red)
                
                
                GradientSlider(
                    value: $greenSliderValue,
                    gradientColors: [
                        Color(red: redSliderValue / 255, green: 0, blue: blueSliderValue / 255),
                        Color( red: redSliderValue / 255, green: 1, blue: blueSliderValue / 255)
                    ], chosenColor: .green)
                
                GradientSlider(
                    value: $blueSliderValue,
                    gradientColors: [
                        Color(red: redSliderValue / 255, green: greenSliderValue / 255,blue: 0),
                        Color(red: redSliderValue / 255,green: greenSliderValue / 255,blue: 1)
                    ], chosenColor: .blue)
            }
                .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            HStack {
                                Button(action: {
                                    print("Up arrow")
                                }) {
                                    Image(systemName: "chevron.compact.up")
                                }
                                .padding()

                                Button(action: {
                                    print("Down arrow")
                                }) {
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
