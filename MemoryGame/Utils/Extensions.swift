//
//  Extensions.swift
//  MemoryGame
//
//  Created by Grayson Ruffo on 2023-01-14.
//

import Foundation
import SwiftUI


extension Array {
    var oneAndOnly: Element? {
        self.count == 1 ? self.first : nil
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        return self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
