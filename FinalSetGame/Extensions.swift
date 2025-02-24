//
//  Extensions.swift
//  FinalSetGame
//
//  Created by Zheen Suseyi on 2/23/25.
//

import Foundation
import SwiftUI
extension String {
    func initalizeCardColor(_ color: String) -> Color {
        switch color {
        case "Red":
            return Color(.red)
        case "Cyan":
            return Color(.cyan)
        case "Green":
            return Color(.green)
        case "Gray":
            return Color(.gray)
        case "Orange":
            return Color(.orange)
        case "Purple":
            return Color(.purple)
        default:
            return Color(.red)
        }
    }
}

