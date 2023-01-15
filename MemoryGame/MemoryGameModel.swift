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
    
    //    private var indexOfTheOnlyFaceupCard: Int? {
    //        get { cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly }
    //        set {
    //
    //            cards.indices.forEach {
    //                cards[$0].hasBeenSeen = cards[$0].isFaceUp && ($0 != newValue)
    //                cards[$0].isFaceUp = ($0 == newValue)
    //            }
    ////            for index in cards.indices {
    ////                if index != newValue {
    ////                    if cards[index].isFaceUp {
    ////                        cards[index].isFaceUp = false
    ////                        cards[index].hasBeenSeen = true
    ////                    }
    ////                } else {
    ////                    cards[index].isFaceUp = true
    ////                }
    ////            }
    //        }
    //    }
    
    private(set) var score = 0
    
    // Mark function as mutating to allow object variable to be altered.
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            
            if let potentialMatchIndex = indexOfTheOnlyFaceupCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                } else {
                    if cards[chosenIndex].hasBeenSeen || cards[potentialMatchIndex].hasBeenSeen {
                        score -= 1
                    }
                }
                indexOfTheOnlyFaceupCard = nil

            } else {
                for index in cards.indices {
                    if cards[index].isFaceUp {
                        cards[index].isFaceUp = false
                        cards[index].hasBeenSeen = true
                    }
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
        var hasBeenSeen: Bool = false
        let content: CardContent
        let id: Int
    }
}

extension Array {
    var oneAndOnly: Element? {
        self.count == 1 ? self.first : nil
    }
}
