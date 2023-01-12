//
//  MemoryGame.swift
//  MemoryGame
//
//  Created by Grayson Ruffo on 2023-01-10.
//

import Foundation

struct MemoryGameModel<CardContent> where CardContent: Equatable {
    // Set private(set) to prevent changes to the variable from outside this scope. Makes it read-only.
    private(set) var cards: Array<Card>
    
    private var indexOfTheOnlyFaceupCard: Int?
    
    // Mark function as mutating to allow object variable to be altered.
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched {
            
            if let potentialMatchIndex = indexOfTheOnlyFaceupCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOnlyFaceupCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOnlyFaceupCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // Add numberOfPairsOfCards x 2 cards to cards array.
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
