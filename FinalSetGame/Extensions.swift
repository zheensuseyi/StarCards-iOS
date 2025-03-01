//
//  Extensions.swift
//  FinalSetGame
//
//  Created by Zheen Suseyi on 2/23/25.
//

import Foundation
import SwiftUI
// extension to turn a string into a color!
let myShapes: [Image] = [Image(systemName: "triangle.fill"), Image(systemName: "circle.fill"), Image(systemName: "star.fill")]
struct Title2Modifer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .fontWeight(.bold)
    }
}
struct LargeTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .fontWeight(.bold)
    }
}




extension View {
    public func title2Bold() -> some View {
        modifier(Title2Modifer())
    }
}
extension View {
    public func largeTitleBold() -> some View {
        modifier(LargeTitleModifier())
    }
}

extension String {
    public func initalizeCardColor(_ color: String) -> Color {
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


// FIXME: add some ViewModifers to make our code cleaner
/*
extension ViewModifier {
    var gameRulesHeadLineText: ViewModifier {
        .font(.title2)
        .fontWeight(.bold)
    }
}

*/
