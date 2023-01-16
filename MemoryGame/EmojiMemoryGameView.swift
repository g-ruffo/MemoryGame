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
    
    @Namespace private var dealingNamespace
    
    var body: some View {
        VStack {
            header
            Spacer()
            gameBody
            deckBody
            footer
            Spacer()
        }.padding()
    }
    
    @State private var dealt = Set<Int>()
    
    private func deal(_ card: Card<String>) {
        dealt.insert(card.id)
    }
    private func clear() {
        dealt.removeAll()
    }
    private func isUndealt(_ card: Card<String>) -> Bool {
        !dealt.contains(card.id)
    }
    
    private func dealAnimation(for card: Card<String>) -> Animation {
        var delay = 0.0
        if let index = viewModel.cards.firstIndex(where: { $0.id == card.id}) {
            delay = Double(index) * (DrawingConstants.totalDealDuration / Double(viewModel.cards.count))
        }
        return Animation.easeInOut(duration: DrawingConstants.dealDuration).delay(delay)
    }
    
    var header: some View {
        HStack {
            Text(viewModel.themeName).font(.largeTitle)
            Spacer()
            Text("\(viewModel.score)").font(.largeTitle)
        }
        .padding(.horizontal, 20.0)
        .animation(nil)
    }
    var gameBody: some View {
        AspectVGrid(items: viewModel.cards, aspectRatio: 2/3) { card in
            if (card.isMatched && !card.isFaceUp) || isUndealt(card) {
                Color.clear
            } else {
                CardView(card: card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .padding(4)
                    .transition(AnyTransition.asymmetric(insertion: .identity, removal: .scale))
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            viewModel.choose(card)
                        }
                    }
            }
            
        }
        .foregroundColor(viewModel.themeColor)
        .font(.largeTitle)
    }
    var deckBody: some View {
        ZStack {
            ForEach(viewModel.cards.filter(isUndealt)) { card in
                CardView(card: card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .transition(AnyTransition.asymmetric(insertion: .opacity, removal: .identity))
            }
        }
        .frame(width: DrawingConstants.undealtWidth, height: DrawingConstants.undealHeight)
        .foregroundColor(viewModel.themeColor)
        .onTapGesture {
                // Deal cards
            for card in viewModel.cards {
                        withAnimation(dealAnimation(for: card)) {
                        deal(card)
                    }
                }
            }
        }
    
    var footer: some View {
        HStack {
            Button("New Game") {
                withAnimation {
                    viewModel.newGame()
                    clear()
                }
            }
            
            Spacer()
            Button("Shuffle") {
                withAnimation(.easeInOut) {
                    viewModel.shuffle()
                }
            }
        }
        .font(.title)
        .padding(.horizontal, 20.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiGameViewModel()
        return EmojiMemoryGameView(viewModel: game)
    }
}
