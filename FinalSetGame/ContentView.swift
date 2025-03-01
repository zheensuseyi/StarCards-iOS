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
                titleAndScore(score: vm.score)
                ScrollView {
                    AspectVGrid(vm: vm)
                }
                buttons(vm: vm)
            }
            .padding()
        }
    }
    
    
    
    
    
    
    
    
    
    
    // MARK: helper views to make contentview look cleaner
    
    struct titleAndScore: View {
        let score: Int
        var body: some View {
            Text("Set Card Game")
                .largeTitleBold()
            Text("Score: \(score)")
                .foregroundColor(.cyan)
                .fontWeight(.bold)
        }
    }
    
    struct buttons: View {
        @ObservedObject var vm: SetCardGame
        var body: some View {
            HStack {
                Button("Add Cards \(Image(systemName: "plus.app.fill"))") {
                    vm.addThreeCards()
                }
                .alert(isPresented: $vm.gameLost) {
                    vm.gameLostAlert
                }
                Spacer()
                NavigationLink(destination: GamesRulesView()) {
                    Label("Game Rules", systemImage: "questionmark.circle.fill") // SF Symbol
                }
            }
            .font(.title2)
        }
    }
}



#Preview {
    ContentView(vm: SetCardGame())
}

