//
//  MemoryGameApp.swift
//  MemoryGame
//
//  Created by Grayson Ruffo on 2023-01-09.
//

import SwiftUI

@main
struct MemoryGameApp: App {
    private let game = EmojiGameViewModel()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
