//
//  Card.swift
//  MemoryGame
//
//  Created by Grayson Ruffo on 2023-01-15.
//

import Foundation

struct Card<CardContent>: Identifiable where CardContent: Equatable {
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    var hasBeenSeen: Bool = false
    let content: CardContent
    let id: Int
}
