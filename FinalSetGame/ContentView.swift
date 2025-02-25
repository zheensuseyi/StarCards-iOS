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
                .foregroundColor(.cyan)
                .fontWeight(.bold)
            ScrollView {
                AspectVGrid(vm: vm)
            }
            HStack {
                buttons(vm: vm)
            }
            .font(.title2)
        }
        .padding()
    }
}





struct buttons: View {
    @ObservedObject var vm: SetCardGame
    var body: some View {
        Button(action: vm.addThreeCards) {
            Label("Add Cards", systemImage: "plus.app.fill") // SF Symbol
        }
    }
}


#Preview {
    ContentView(vm: SetCardGame())
}

