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
        ScrollView {
            Text("How To Play")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            VStack(alignment: .center, content: {
                Text("Each Card Has 4 Characteristics")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("1. Shape \n2. Number of Shapes\n3. Shape Color\n4. Background Color\n")
                Spacer()
                Text("With 3 different attributes")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("1. Shape: Triangle🔺 Star⭐️ Circle🔵 \n2. Number Of Shapes: 1️⃣ 2️⃣ 3️⃣ \n3. Shape Color: Red Yellow Blue \n4. Background Color: Green Yellow Purple\n")
                Text("All 81 cards in the deck are unique\n")
                    .fontWeight(.bold)
                Spacer()
                Text("Finding A Set")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("A set is defined as 3 selected cards where each of its attributes are either")
                Text("a. All The Same or b. All Different")
                    .fontWeight(.bold)
                Text("In order to check your answer, tap on any 3 cards\nDeselect cards by tapping again\n")
                Spacer()
                Text("Scoring")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("You lose 3 points if you add 3 more cards\nYou lose 9 points on an inncorrect guess\nIf your score is 0, the game is lost\nIf you find a set, you WIN!")
                Spacer()
                    .padding()
            })
        }
        
        .font(.callout)
        .padding()
    }
}


#Preview {
    GamesRulesView()
}
