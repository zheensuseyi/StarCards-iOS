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
        ZStack {
            dayTimeGradient()
            VStack {
                Text("Game Rules🌤️")
                    .mainTitleText()
                VStack(alignment: .center, content: {
                    partOne
                    partTwo
                    partThree
                    partFour
                    partFive
                })
                .ruleText()
            }
        }
    }
    
    
    
    // MARK: every text view
    @ViewBuilder
    private var partOne: some View {
        Text("Each Card Has 4 Characteristics")
            .title2Text()
        Text("With 3 Different Attributes")
            .title2Text()
        Text("1. Shape \(Image.star) \(Image.triangle) \(Image.circle)")
        HStack {
            Text("2. Number Of Shapes")
            Text("\(Image.circle) | \(Image.circle) \(Image.circle) | \(Image.circle) \(Image.circle) \(Image.circle)")
        }
    }
    
    @ViewBuilder
    private var partTwo: some View {
        HStack {
            Text("3. Shape Color")
            Image.star
                .foregroundColor(.red)
            Image.star
                .foregroundColor(.yellow)
            Image.star
                .foregroundColor(.blue)
        }
    }
    
    @ViewBuilder
    private var partThree: some View {
        HStack {
            Text("4. Background Color")
            Text("\(Image.triangle)")
                .background(.green)
            Text("\(Image.triangle)")
                .background(.orange)
            Text("\(Image.triangle)")
                .background(.purple)
        }
        Text("All 81 cards in the deck are unique")
            .fontWeight(.bold)
        Spacer()
    }
    
    @ViewBuilder
    private var partFour: some View {
        Text("Finding A Set")
            .title2Text()
        Text("A set is defined as 3 selected cards where each of its attributes are either")
        Text("a. All The Same or b. All Different")
            .fontWeight(.bold)
        Text("In order to check your answer, tap on any 3 cards")
        Text("Deselect cards by tapping again")
        Spacer()
    }
    
    @ViewBuilder
    private var partFive: some View {
        Text("Scoring")
            .title2Text()
        Text("You lose 3 points if you add 3 more cards")
        Text("You lose 9 points on an inncorrect guess")
        Text("If your score is 0, the game is lost")
        Text("If you find a set, you WIN!")
    }
}





#Preview {
    GamesRulesView()
}
