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
        NavigationStack {
            VStack {
                Text("Find A Set!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Score: \(vm.score)")
                    .foregroundColor(.cyan)
                    .fontWeight(.bold)
                ScrollView {
                    AspectVGrid(vm: vm)
                }
                buttons(vm: vm)
            }
            .padding()
        }
    }
}






struct buttons: View {
    @ObservedObject var vm: SetCardGame
    var body: some View {
            HStack {
                Button(action: vm.addThreeCards) {
                    Label("Add Cards", systemImage: "plus.app.fill") // SF Symbol
                }
                Spacer()
                NavigationLink(destination: GamesRulesView()) {
                    Label("Game Rules", systemImage: "questionmark.circle.fill") // SF Symbol
                }
            }
            .font(.title2)
        }
    }



#Preview {
    ContentView(vm: SetCardGame())
}

