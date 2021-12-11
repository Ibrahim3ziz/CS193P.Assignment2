//
//  MemoryGame.swift
//  Memorize
//
//  Created by Ibrahim Abdul Aziz on 06/12/2021.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
    private(set) var score = 0 
    private var indexOfOneAndTheOnly: Int?
    
    mutating func chooseCard(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        
        {
            if let potentialMatchIndex = indexOfOneAndTheOnly {
                // if there was already one and only face up card
                if cards[chosenIndex].cardContent == cards[potentialMatchIndex].cardContent {
                // if the two cards have the same content -> match the two and win +2 score
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                } else {
                    if cards[chosenIndex].isSeenCard || cards[potentialMatchIndex].isSeenCard {
                        score -= 1
                    }
                }
                indexOfOneAndTheOnly = nil
            } else {
                for index in cards.indices {
                    if cards[index].isFaceUp {
                        cards[index].isFaceUp = false
                        cards[index].isSeenCard = true
                    }
                }
                indexOfOneAndTheOnly = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
        print("Card choosen\(card)")
    }
    
    
    mutating func newGame() {
        
        cards.shuffle()
        score = 0
    }
    
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = [Card]()


        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(cardContent: content, id: pairIndex*2))
            cards.append(Card(cardContent: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    
    

    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var isSeenCard: Bool = false
        var cardContent: CardContent
        var id: Int

    }
    
    
  


    
}


