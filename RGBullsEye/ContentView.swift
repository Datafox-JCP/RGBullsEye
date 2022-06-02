//
//  ContentView.swift
//  RGBullsEye
//
//  Created by Juan Hernandez Pazos on 27/05/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State var game = Game()
    @State var guess: RGB
    @State var showScore = false
    
    // Proportions for different screen sizes
    let circleSize: CGFloat = 0.275
    let labelHeight: CGFloat = 0.06
    let labelWidth: CGFloat = 0.53
    let buttonWidth: CGFloat = 0.87
    
    var target = RGB.random()

    // MARK: - View
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.element
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    ColorCircle(rgb: game.target, size: proxy.size.height *  circleSize)
                    
                    if !showScore {
                        BevelText(text: "R: ???? G: ??? B: ???", width: proxy.size.width * labelWidth, height: proxy.size.height * labelHeight)
                    } else {
                        BevelText(text: game.target.intString(), width: proxy.size.width * labelWidth, height: proxy.size.height * labelHeight)
                    }
                    
                    ColorCircle(rgb: guess, size: proxy.size.height *  circleSize)
                    
                    BevelText(text: guess.intString(), width: proxy.size.width * labelWidth, height: proxy.size.height * labelHeight)
                    
                    ColorSlider(value: $guess.red, trackColor: .red)
                    ColorSlider(value: $guess.green, trackColor: .green)
                    ColorSlider(value: $guess.blue, trackColor: .blue)
                    
                    Button("Hit me!") {
                        showScore = true
                        game.check(guess: guess)
                    }
                    .buttonStyle(NewButtonStyle(width: proxy.size.width * buttonWidth, height: proxy.size.height * labelHeight))
                    .alert(isPresented: $showScore) {
                        Alert(title: Text("Your score"),
                              message: Text(String(game.scoreRound)),
                              dismissButton: .default(Text("OK")) {
                            game.startNewRound()
                            guess = RGB()
                        })
                    }
                } // VStack
                .font(.headline)
            } // ZStack
        } // GeometryReader
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView(guess: RGB())
                .previewDevice("iPhone 13 mini")
                .padding(.horizontal)
    }
}

// MARK: - Subviews
struct ColorSlider: View {
    // MARK: - Properties
    @Binding var value: Double
    var trackColor: Color
    
    // MARK: - View
    var body: some View {
        HStack {
            Text("0")
            Slider(value: $value)
                .accentColor(trackColor)
            Text("255")
        }
        .font(.subheadline)
        .padding(.horizontal)
    }
}
