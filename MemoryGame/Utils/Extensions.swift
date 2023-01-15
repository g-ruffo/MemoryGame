//
//  Extensions.swift
//  MemoryGame
//
//  Created by Grayson Ruffo on 2023-01-14.
//

import Foundation


extension Array {
    var oneAndOnly: Element? {
        self.count == 1 ? self.first : nil
    }
}
