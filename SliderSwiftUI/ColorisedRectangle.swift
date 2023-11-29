//
//  ColorisedRectangle.swift
//  SliderSwiftUI
//
//  Created by Артемий Дериглазов on 25.11.2023.
//

import SwiftUI

struct ColorisedRectangle: View {
    let redSliderValue: Double
    let greenSliderValue: Double
    let blueSliderValue: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 36)
            .frame(height: UIScreen.main.bounds.height / 5)
            .foregroundColor(
                Color(
                    red: redSliderValue / 255,
                    green: greenSliderValue / 255,
                    blue: blueSliderValue / 255)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 36)
                    .stroke(Color.black, lineWidth: 4)
            )
            .padding(20)
    }
}
