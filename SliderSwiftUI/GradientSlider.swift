//
//  GradientSlider.swift
//  SliderSwiftUI
//
//  Created by Артемий Дериглазов on 19.11.2023.
//

import SwiftUI

struct GradientSlider: View {
    @Binding var value: Double
    
    let gradientColors: [Color]
    let chosenColor: ChosenColor
    
    enum ChosenColor {
        case red, green, blue
    }
    
    var body: some View {
        
        HStack {
            
            Text(textByColor())
                .frame(width: 50)
            
            ZStack(alignment: .leading) {
                LinearGradient(
                    gradient: Gradient(colors: gradientColors),
                    startPoint: .leading,
                    endPoint: .trailing)
                .frame(width: 190, height: 4)
                .cornerRadius(5)
                
                Slider(value: $value, in: 0...255, step: 1)
                    .accentColor(Color.clear)
                    .frame(width: 190)
                
            }
            
            TextField("", value: $value, formatter: NumberFormatter())
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .frame(width: 50)
                .padding()
        }
        .padding(-10)
    }
    
    private func textByColor() -> String {
        switch chosenColor {
        case .red:
            return "R"
        case .green:
            return "G"
        case .blue:
            return "B"
        }
    }
}

