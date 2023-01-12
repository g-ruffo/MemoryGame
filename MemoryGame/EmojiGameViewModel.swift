//
//  EmojiMemoryGame.swift
//  MemoryGame
//
//  Created by Grayson Ruffo on 2023-01-10.
//

import SwiftUI

class EmojiGameViewModel: ObservableObject {
    
    static var emojis: Array<String> = ["😄", "😜", "😍", "🥸", "😡", "🤯", "😱", "😰", "😓", "🥵", "🥺", "🤒", "😵‍💫", "🤢", "🤮", "😴", "🥶"]
    
    static func createMemoryGame() -> MemoryGameModel<String> {
        MemoryGameModel<String>(numberOfPairsOfCards: 4) {
            pairIndex in emojis[pairIndex] }
    }
        
    // Use @Published annotaion to inform ui that updates have been made and need to be redrawn.
    @Published private(set) var model: MemoryGameModel<String> = createMemoryGame()
    
//    var cards: Array<MemoryGameModel<String>.Card> {
//        return model.cards
//    }
    
    // MARK: - Intent(s)
    func choose(_ card: MemoryGameModel<String>.Card) {
        model.choose(card)
    }
}
