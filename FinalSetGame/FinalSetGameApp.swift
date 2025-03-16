//
//  FinalSetGameApp.swift
//  FinalSetGame
//
//  Created by Zheen Suseyi on 2/14/25.
//

import SwiftUI

@main
struct FinalSetGameApp: App {
    var body: some Scene {
        @StateObject var vm = SetCardGame()
        WindowGroup {
            ContentView(vm: vm)
        }
    }
}
