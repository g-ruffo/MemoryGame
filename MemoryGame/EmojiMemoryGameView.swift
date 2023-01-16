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
            header
            Spacer()
            gameBody
            Spacer()
            footer
            Spacer()
        }
    }
    
    var header: some View {
        HStack {
            Text(viewModel.themeName).font(.largeTitle)
            Spacer()
            Text("\(viewModel.score)").font(.largeTitle)
        }
        .padding(.horizontal, 40.0)
    }
    var gameBody: some View {
            AspectVGrid(items: viewModel.cards, aspectRatio: 2/3) { card in
                if card.isMatched && !card.isFaceUp {
                    Color.clear
                } else {
                    CardView(card: card)
                        .padding(4)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                viewModel.choose(card)
                            }
                        }
                }
            }
            .foregroundColor(viewModel.themeColor)
            .font(.largeTitle)
            .padding(.horizontal)
    }
    var footer: some View {
        HStack {
            Button("New Game") {
                viewModel.newGame()
            }
        
        Spacer()
            Button("Shuffle") {
                withAnimation(.easeInOut) {
                    viewModel.shuffle()
                }
            }
        }
        .font(.largeTitle)
        .padding(.horizontal, 40.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiGameViewModel()
        return EmojiMemoryGameView(viewModel: game)
    }
}
