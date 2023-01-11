//
//  ContentView.swift
//  MemoryGame
//
//  Created by Grayson Ruffo on 2023-01-09.
//

import SwiftUI

struct ContentView: View {
    
    let viewModel: EmojiGameViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .foregroundColor(.red)
            }
            
            .font(.largeTitle)
            .padding(.horizontal)
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiGameViewModel()
        ContentView(viewModel: game)
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
            } else{
                shape.fill()
            }
        }
        }
    
}
