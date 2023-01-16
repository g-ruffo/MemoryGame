//
//  EmojiMemoryGame.swift
//  MemoryGame
//
//  Created by Grayson Ruffo on 2023-01-10.
//

import SwiftUI

class EmojiGameViewModel: ObservableObject {
    
    init() {
        theme = EmojiGameViewModel.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiGameViewModel.createMemoryGame(theme: theme)
    }
    
    static var themes: Array<Theme> = [
        Theme(name: "faces",
              emojis: ["😄", "😜", "😍", "🥸", "😡", "🤯", "😱", "😰", "😓", "🥵", "🥺", "🤒", "😵‍💫", "🤢", "🤮", "😴", "🥶"],
              numberOfPairsOfCards: DrawingConstants.startSizeDeck,
              color: "red"
              ),
        Theme(name: "vehicles",
              emojis: ["✈️", "🚁", "⛴️", "🛰️", "💺", "🚊", "🚖", "⛵️", "🛶"],
              numberOfPairsOfCards: DrawingConstants.startSizeDeck,
              color: "blue"
              ),
        Theme(name: "animals",
              emojis: ["🦍", "🦘", "🐘", "🛰️", "🐆", "🐐", "🐈", "🐈‍⬛", "🐊"],
              numberOfPairsOfCards: DrawingConstants.startSizeDeck,
              color: "green"
              )
    ]
    
    static func createMemoryGame(theme: Theme) -> MemoryGameModel<String> {
        MemoryGameModel<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards) {
            pairIndex in theme.emojis[pairIndex]
        }
    }
        
    // Use @Published annotaion to inform ui that updates have been made and need to be redrawn.
    @Published private var model: MemoryGameModel<String>
    
    private var theme: Theme
    
    var themeName: String {
        return theme.name
    }
    var themeColor: Color {
        switch theme.color {
        case "red" : return .red
        case "blue" : return .blue
        case "green" : return .green
        default : return .gray
        }
    }
    
    var score: Int {
        return model.score
    }
    
    var cards: Array<Card<String>> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    func choose(_ card: Card<String>) {
        model.choose(card)
    }
    
    func newGame() {
        theme = EmojiGameViewModel.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiGameViewModel.createMemoryGame(theme: theme)
    }
    
    func shuffle() {
        model.shuffle()
    }
}
