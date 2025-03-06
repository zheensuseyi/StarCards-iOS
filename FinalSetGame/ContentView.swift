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
            ZStack {
                nightTimeGradient()
                VStack {
                    titleAndScore(score: vm.score)
                    ScrollView {
                        AspectVGrid(vm: vm)
                    }
                    buttons(vm: vm)
                }
                .scrollIndicators(.hidden)
                .padding()
            }
        }
    }
    
    // MARK: helper views to make contentview look cleaner
    private struct titleAndScore: View {
        let score: Int
        var body: some View {
            Text("Sky Cards✨")
                .largeTitleBold()
            Text("Score: \(score)")
                .foregroundStyle(Color.starYellow)
                .fontWeight(.medium)
        }
    }
    
    private struct buttons: View {
        @ObservedObject var vm: SetCardGame
        var body: some View {
            HStack {
                Button("Add Cards \(Image(systemName: "plus.app.fill"))") {
                    vm.addThreeCards()
                }
                .foregroundStyle(.white)
                Spacer()
                NavigationLink(destination: GamesRulesView(vm: vm)) {
                    Label("Game Rules", systemImage: "questionmark.circle.fill")
                }
                .foregroundStyle(.white)
            }
            .alert(isPresented: $vm.gameOver) {
                vm.gameOverAlert
            }
            .font(.title2)
        }
    }
}



#Preview {
    ContentView(vm: SetCardGame())
}

