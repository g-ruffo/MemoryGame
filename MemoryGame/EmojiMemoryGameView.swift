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
                Spacer()

                Text("\(viewModel.score)").font(.largeTitle)
                Spacer()
            }
            
            Spacer()
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
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
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(Color.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.strokeCardBorder)
                    Text(card.content).font(font(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(0)
                } else{
                    shape.fill()
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
}

private struct DrawingConstants {
    static let cornerRadius: CGFloat = 20
    static let strokeCardBorder: CGFloat = 3
    static let fontScale: CGFloat = 0.8
}
