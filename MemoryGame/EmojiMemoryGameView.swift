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
                Spacer()
                Text(viewModel.themeName).font(.largeTitle)
                Spacer()
                Text("\(viewModel.score)").font(.largeTitle)
                Spacer()
            }
            
            Spacer()
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
                .foregroundColor(viewModel.themeColor)
            }
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
        EmojiMemoryGameView(viewModel: game)
    }
}

struct CardView: View {
    let card: MemoryGameModel<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(Color.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else{
                shape.fill()
            }
        }
    }
    
}
