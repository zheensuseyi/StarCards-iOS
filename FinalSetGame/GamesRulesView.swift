//
//  GamesRulesView.swift
//  FinalSetGame
//
//  Created by Zheen Suseyi on 2/26/25.
//

import SwiftUI

// FIXME: add extentions so that the code looks cleaner, maybe add another struct for all this text?
struct GamesRulesView: View {
    @ObservedObject var vm: SetCardGame
    var body: some View {
        ZStack {
            backgroundGradient()
            VStack {
                Text("Game Rules")
                    .largeTitleBold()
                VStack(alignment: .center, content: {
                    partOne(vm: vm)
                    partTwo(vm: vm)
                    partThree()
                    partFour()
                })
                .padding()
                .foregroundColor(.black)
                .font(.headline)
            }
        }
    }
               
    
    
    // MARK: every text view
    
    private struct partOne: View {
        @ObservedObject var vm: SetCardGame
        var body: some View {
            Text("Each Card Has 4 Characteristics")
                .title2Bold()
            Text("With 3 Different Attributes")
                .title2Bold()
            Text("1. Shape \(vm.Star) \(vm.Triangle) \(vm.Circle)")
            HStack {
                Text("2. Number Of Shapes")
                Text("\(vm.Circle) | \(vm.Circle) \(vm.Circle) | \(vm.Circle) \(vm.Circle) \(vm.Circle)")
            }
        }
    }
    
    private struct partTwo: View {
        @ObservedObject var vm: SetCardGame
        var body: some View {
            HStack {
                Text("3. Shape Color")
                Text("\(vm.Star)")
                    .foregroundColor(.red)
                Text("\(vm.Star)")
                    .foregroundColor(.yellow)
                Text("\(vm.Star)")
                    .foregroundColor(.blue)
            }
            HStack {
                Text("4. Background Color")
                Text("\(vm.Triangle)")
                    .background(.green)
                Text("\(vm.Triangle)")
                    .background(.orange)
                Text("\(vm.Triangle)")
                    .background(.purple)
            }
            Text("All 81 cards in the deck are unique")
                .fontWeight(.bold)
            Spacer()
        }
    }
    
    private struct partThree: View {
        var body: some View {
            Text("Finding A Set")
                .title2Bold()
            Text("A set is defined as 3 selected cards where each of its attributes are either")
            Text("a. All The Same or b. All Different")
                .fontWeight(.bold)
            Text("In order to check your answer, tap on any 3 cards")
            Text("Deselect cards by tapping again")
            Spacer()
            
        }
    }
    
    private struct partFour: View {
        var body: some View {
            Text("Scoring")
                .title2Bold()
            Text("You lose 3 points if you add 3 more cards")
            Text("You lose 9 points on an inncorrect guess")
            Text("If your score is 0, the game is lost")
            Text("If you find a set, you WIN!")
        }
    }
}




#Preview {
    GamesRulesView(vm: SetCardGame())
}
