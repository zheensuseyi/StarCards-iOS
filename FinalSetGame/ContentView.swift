//
//  ContentView.swift
//  FinalSetGame
//
//  Created by Zheen Suseyi on 2/14/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm: SetCardGame
    var body: some View {
        VStack {
            ScrollView {
                Text("Hello, world! \(vm.startingDeck.count)")
                Text("Hello, earth! \(vm.cardDeck.count)")
            }
            Button("Add some cards!") {
                vm.addThreeCards()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView(vm: SetCardGame())
}
