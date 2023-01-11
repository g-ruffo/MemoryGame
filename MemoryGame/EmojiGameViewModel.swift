//
//  EmojiMemoryGame.swift
//  MemoryGame
//
//  Created by Grayson Ruffo on 2023-01-10.
//

import SwiftUI

class EmojiGameViewModel {
    
    static var emojis: Array<String> = ["😄", "😜", "😍", "🥸", "😡", "🤯", "😱", "😰", "😓", "🥵", "🥺", "🤒", "😵‍💫", "🤢", "🤮", "😴", "🥶"]
    
    static func createMemoryGame() -> MemoryGameModel<String> {
        MemoryGameModel<String>(numberOfPairsOfCards: 4) { pairIndex in emojis[pairIndex] }

    }
    
    private var model: MemoryGameModel<String> = createMemoryGame()
    
    var cards: Array<MemoryGameModel<String>.Card> {
        return model.cards
    }

}
