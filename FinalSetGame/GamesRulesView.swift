//
//  GamesRulesView.swift
//  FinalSetGame
//
//  Created by Zheen Suseyi on 2/26/25.
//

import SwiftUI

// FIXME: add extentions so that the code looks cleaner, maybe add another struct for all this text?
struct GamesRulesView: View {
    var body: some View {
        VStack {
            Text("Game Rules")
                .largeTitleBold()
            Spacer()
            ScrollView {
                VStack(alignment: .center, content: {
                    partOne()
                    partTwo()
                    partThree()
                    partFour()
                })
            }
            .font(.headline)
            .fontWeight(.light)
            .padding()
        }
    }

    
    // MARK: every text view
    
    struct partOne: View {
        var body: some View {
            Text("Each Card Has 4 Characteristics With 3 Different Attributes")
                .title2Bold()
            Spacer()
            Text("1. Shape \(myShapes[0]) \(myShapes[1]) \(myShapes[2])")
            HStack {
                Text("2. Number Of Shapes")
                Text("\(myShapes[1]) | \(myShapes[1]) \(myShapes[1]) | \(myShapes[1]) \(myShapes[1]) \(myShapes[1])")
            }
        }
    }
    
    struct partTwo: View {
        var body: some View {
            HStack {
                Text("3. Shape Color")
                Text("\(myShapes[2])")
                    .foregroundColor(.red)
                Text("\(myShapes[2])")
                    .foregroundColor(.yellow)
                Text("\(myShapes[2])")
                    .foregroundColor(.blue)
            }
            HStack {
                Text("4. Background Color")
                Text("\(myShapes[0])")
                    .background(.green)
                Text("\(myShapes[0])")
                    .background(.orange)
                Text("\(myShapes[0])")
                    .background(.purple)
            }
            Spacer()
            Text("All 81 cards in the deck are unique\n")
                .fontWeight(.bold)
            Spacer()
                .padding()
        }
    }
    
    struct partThree: View {
        var body: some View {
            Text("Finding A Set")
                .title2Bold()
            Spacer()
            Text("A set is defined as 3 selected cards where each of its attributes are either")
            Text("a. All The Same or b. All Different")
                .fontWeight(.bold)
            Text("In order to check your answer, tap on any 3 cards\nDeselect cards by tapping again\n")
            Spacer()
                .padding()
        }
    }
    
    struct partFour: View {
        var body: some View {
            Text("Scoring")
                .title2Bold()
            Spacer()
            Text("You lose 3 points if you add 3 more cards\nYou lose 9 points on an inncorrect guess\nIf your score is 0, the game is lost\nIf you find a set, you WIN!")
        }
    }
}




#Preview {
    GamesRulesView()
}
