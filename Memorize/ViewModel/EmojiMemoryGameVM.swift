//
//  EmojiMemoryGameVM.swift
//  Memorize
//
//  Created by Ibrahim Abdul Aziz on 06/12/2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    init() {
        theme = allThemes.randomElement()!
        gameModel = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    @Published private(set) var gameModel: MemoryGame<String>
    private var theme: Theme
        
    
    var allThemes = [sportTheme,hallowenTheme,flagTheme,vehicleTheme,emojiTheme]
    

    
    var cardColor: Color {
        switch theme.cardColor {
        case "green":
            return .green
        case "red":
            return .red
        case "black":
            return .black
        case "blue":
            return .blue
        case "yellow":
            return .yellow
        default:
            return .orange
        }
    }
    

    
    var cards: Array<MemoryGame<String>.Card> {
        gameModel.cards
    }
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards) { pairIndex in
            theme.emojis[pairIndex]
        }
    }
    

    

    
    // MARK: - User  intents
    
    func chooseCard(card: MemoryGame<String>.Card) {
        gameModel.chooseCard(card)
    }
    
    func newGame() {
        gameModel = EmojiMemoryGame.createMemoryGame(theme: theme)
        gameModel.newGame()
    }
    
}
