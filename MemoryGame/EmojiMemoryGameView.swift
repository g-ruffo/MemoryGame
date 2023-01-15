//
//  ContentView.swift
//  MemoryGame
//
//  Created by Grayson Ruffo on 2023-01-09.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    // Use @ObservedObject annotaion to notify ui to listen from changes in view model.
    @ObservedObject var viewModel: EmojiGameViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.themeName).font(.largeTitle)
                Spacer()
                Text("\(viewModel.score)").font(.largeTitle)
            }
            .padding(.horizontal, 40.0)
            Spacer()
            AspectVGrid(items: viewModel.cards, aspectRatio: 2/3) { card in
                if card.isMatched && !card.isFaceUp {
                    Rectangle().opacity(0)
                } else {
                    CardView(card: card)
                        .padding(4)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
            
            .foregroundColor(viewModel.themeColor)
            .font(.largeTitle)
            .padding(.horizontal)
            
            Spacer()
            
            Button("New Game") {
                viewModel.newGame()
            }
            .font(.largeTitle)
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiGameViewModel()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(viewModel: game)
    }
}
