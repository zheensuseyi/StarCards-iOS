//
//  Extensions.swift
//  FinalSetGame
//
//  Created by Zheen Suseyi on 2/23/25.
//

import Foundation
import SwiftUI

// title 2 modifier
struct Title2Modifer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .fontWeight(.bold)
    }
}

// large title modifier
struct LargeTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .font(.largeTitle)
            .fontWeight(.light)
    }
}


// view extensions
extension View {
    public func dayTimeGradient() -> some View {
        LinearGradient(gradient: Gradient(colors: [.cyan, .white]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    }
    public func nightTimeGradient() -> some View {
        return LinearGradient(gradient: Gradient(colors: [.darkBlue, .indigo]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    }
    public func largeTitleBold() -> some View {
        modifier(LargeTitleModifier())
    }
    public func title2Bold() -> some View {
        modifier(Title2Modifer())
    }
}

extension Color {
    static let darkBlue = Color(red: 0.1, green: 0.2, blue: 0.5)
    static let starYellow = Color(red: 1.0, green: 1.0, blue: 0.0)
}

// animation extension that makes our animation work
extension Animation {
    func rotate(_ isSelected: Bool) -> Animation {
        if isSelected {
            return Animation.linear(duration: 1).repeatForever(autoreverses: false)
        }
        else {
            return self
        }
    }
}
