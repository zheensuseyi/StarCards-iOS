//
//  Extensions.swift
//  FinalSetGame
//
//  Created by Zheen Suseyi on 2/23/25.
//

import Foundation
import SwiftUI

// extension to turn a string into a color!
struct Title2Modifer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .fontWeight(.bold)
    }
}

extension View {
    public func title2Bold() -> some View {
        modifier(Title2Modifer())
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
    public func largeTitleBold() -> some View {
        modifier(LargeTitleModifier())
    }
}

/*struct BackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(content: { LinearGradient(gradient: Gradient(colors: [.cyan, .white]), startPoint: .top, endPoint: .bottom) })
            .ignoresSafeArea()
    }
}*/
extension View {
    public func backgroundGradient() -> some View {
        LinearGradient(gradient: Gradient(colors: [.cyan, .white]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    }
}


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
