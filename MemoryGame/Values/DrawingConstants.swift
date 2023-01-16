//
//  DrawingConstants.swift
//  MemoryGame
//
//  Created by Grayson Ruffo on 2023-01-15.
//

import Foundation
import SwiftUI

struct DrawingConstants {
    static let cornerRadius: CGFloat = 10
    static let strokeCardBorder: CGFloat = 3
    static let fontScale: CGFloat = 0.6
    static let circleTimerOpacity: CGFloat = 0.5
    static let fontSize: CGFloat = 32
    static let startSizeDeck: Int = 4
    
    static let aspectRatio: CGFloat = 2/3
    static let dealDuration: Double = 0.5
    static let totalDealDuration: Double = 2
    static let undealHeight: CGFloat = 90
    static let undealtWidth = undealHeight * aspectRatio
}
