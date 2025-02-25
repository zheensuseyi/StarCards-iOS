//
//  Extensions.swift
//  FinalSetGame
//
//  Created by Zheen Suseyi on 2/23/25.
//

import Foundation
import SwiftUI
// extension to turn a string into a color!
extension String {
    func initalizeCardColor(_ color: String) -> Color {
        switch color {
        case "Red":
            return Color(.red)
        case "Yellow":
            return Color(.yellow)
        case "Blue":
            return Color(.blue)
        case "Green":
            return Color(.green)
        case "Orange":
            return Color(.orange)
        case "Purple":
            return Color(.purple)
        default:
            return Color(.red)
        }
    }
}

