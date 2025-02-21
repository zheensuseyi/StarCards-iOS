//
//  ContentView.swift
//  FinalSetGame
//
//  Created by Zheen Suseyi on 2/14/25.
//

import SwiftUI

// FIXME: Make checkanswer actually work lol...
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
                Button(action: vm.addThreeCards) {
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

/*Button(action: {
    // Action to perform when button is tapped
    print("Custom button tapped!")
}) {
    HStack {
        Image(systemName: "star.fill")
        Text("Favorite")
    }
    .padding()
    .background(Color.blue)
    .foregroundColor(.white)
    .cornerRadius(8)
}
*/
