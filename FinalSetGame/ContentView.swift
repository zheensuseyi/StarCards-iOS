//
//  ContentView.swift
//  FinalSetGame
//
//  Created by Zheen Suseyi on 2/14/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = SetCardGame()
    var body: some View {
        NavigationStack {
            ZStack {
                nightTimeGradient()
                VStack {
                    titleScoreDisplay
                    ScrollView {
                        AspectVGrid(vm: vm)
                    }
                    buttons
                }
                .contentViewModifier()
            }
        }
    }
    
    // MARK: View builders to make ContentView look cleaner
    @ViewBuilder
    private var titleScoreDisplay: some View {
        Text("Sky Cards✨")
            .mainTitleText()
        Text("Score: \(vm.score)")
            .scoreText()
    }
    
    @ViewBuilder
    private var buttons: some View {
        HStack {
            Button("Add Cards \(Image(systemName: "plus.app.fill"))") {
                vm.addCards()
            }
            Spacer()
            NavigationLink(destination: GamesRulesView()) {
                Label("Game Rules", systemImage: "questionmark.circle.fill")
            }
        }
        .alert(isPresented: $vm.gameChange) {
            vm.gameAlert
        }
        .buttonText()
    }
}


#Preview {
    ContentView()
}

