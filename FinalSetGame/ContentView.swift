//
//  ContentView.swift
//  FinalSetGame
//
//  Created by Zheen Suseyi on 2/14/25.
//

import SwiftUI

// FIXME: Make this code a little cleaner
struct ContentView: View {
    @ObservedObject var vm: SetCardGame
    var body: some View {
        VStack {
            Text("Find A Set!")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Score: \(vm.score)")
            ScrollView {
                AspectVGrid(vm: vm)
            }
            HStack {
                Button(action: vm.addThreeCards) {
                    Label("Add Cards", systemImage: "plus.app.fill") // SF Symbol
                }
                
                Spacer()
                
                Button(action: vm.checkAnswer) {
                    Label("Check Answer", systemImage: "checkmark.shield.fill") // SF Symbol
                }
            }
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView(vm: SetCardGame())
}

