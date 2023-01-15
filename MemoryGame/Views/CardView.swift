//
//  CardView.swift
//  MemoryGame
//
//  Created by Grayson Ruffo on 2023-01-14.
//

import SwiftUI

struct CardView: View {
    let card: Card<String>
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(Color.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.strokeCardBorder)
                    Circle().opacity(DrawingConstants.circleTimerOpacity).padding(5)
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
