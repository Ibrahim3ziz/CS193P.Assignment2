//
//  EmojiMemoryGameVM.swift
//  Memorize
//
//  Created by Ibrahim Abdul Aziz on 06/12/2021.
//

import SwiftUI

class EmojiMemoryGameVM: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    

    @Published private(set) var gameModel: MemoryGame<String> = createMemoryGame(theme: theme)
    
    static var theme = emojiTheme
        
        

    
    var cardColor: Color {
        switch EmojiMemoryGameVM.theme.cardColor {
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
    

    
    var cards: [Card] {
        gameModel.cards
    }
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards, cardContentFactory: { pairIndex in
            theme.emojis[pairIndex] }, theme: theme)
    }


    
    // MARK: - User  intents
    
    func chooseCard(card: Card) {
        gameModel.chooseCard(card)
    }
    
    func newGame() {
        gameModel = EmojiMemoryGameVM.createMemoryGame(theme: EmojiMemoryGameVM.theme)
        gameModel.newGame()
    }
    
}
