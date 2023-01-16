//
//  Card.swift
//  MemoryGame
//
//  Created by Grayson Ruffo on 2023-01-15.
//

import Foundation

struct Card<CardContent>: Identifiable where CardContent: Equatable {
    var isFaceUp: Bool = false {
        didSet {
            if isFaceUp {
                startUsingBonusTime()
            } else {
                stopUsingBonusTime()
            }
        }
    }
    var isMatched: Bool = false {
        didSet {
            stopUsingBonusTime()
        }
    }
    var hasBeenSeen: Bool = false
    let content: CardContent
    let id: Int
    
    
    var bonusTimeLimit: TimeInterval = DrawingConstants.bonusTimeLimit
    private var faceUpTime: TimeInterval {
        if let lastFaceUpDate = self.lastFaceUpDate {
            return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpDate)
        } else {
            return pastFaceUpTime
        }
    }
    var lastFaceUpDate: Date?
    var pastFaceUpTime: TimeInterval = 0
    var bonusTimeRemaining: TimeInterval {
        max(0, bonusTimeLimit - faceUpTime)
    }
    var bonusRemaining: Double {
        (bonusTimeLimit > 0 && bonusTimeRemaining > 0) ? bonusTimeRemaining / bonusTimeLimit : 0
    }
    var hasEarnedBonus: Bool {
        isFaceUp && !isMatched && bonusTimeRemaining > 0
    }
    var isConsumingBonusTime: Bool {
        isFaceUp && !isMatched && bonusTimeRemaining > 0
    }
    private mutating func startUsingBonusTime( ) {
        if isConsumingBonusTime, lastFaceUpDate == nil {
            lastFaceUpDate = Date()
        }
    }
    private mutating func stopUsingBonusTime( ) {
        pastFaceUpTime = faceUpTime
        self.lastFaceUpDate = nil
    }
    
}
