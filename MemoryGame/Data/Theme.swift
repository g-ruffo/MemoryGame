//
//  Theme.swift
//  MemoryGame
//
//  Created by Grayson Ruffo on 2023-01-11.
//

import Foundation


struct Theme {
    let name: String
    var emojis: Array<String>
    var numberOfPairsOfCards: Int
    let color: String
    
    init(name: String, emojis: Array<String>, numberOfPairsOfCards: Int, color: String) {
        self.name = name
        self.emojis = emojis
        self.numberOfPairsOfCards = numberOfPairsOfCards > emojis.count ? emojis.count : numberOfPairsOfCards
        self.color = color
    }
}
