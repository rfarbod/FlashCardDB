//
//  Colors.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/14/25.
//

import SwiftUI

public extension Color {
    static var randomBright: Color {
        let hue = Double.random(in: 0...1)
        let saturation = Double.random(in: 0.5...1)
        let brightness = Double.random(in: 0.7...1)
        return Color(hue: hue, saturation: saturation, brightness: brightness)
    }
}
