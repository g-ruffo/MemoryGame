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
                    Pie(startAngle: Angle(degrees: 0 - 90), endAngle: Angle(degrees:110 - 90))
                        .opacity(DrawingConstants.circleTimerOpacity).padding(5)
                    Text(card.content).font(font(in: geometry.size))
                }
            .cardify(isFaceUp: card.isFaceUp)

            }
        }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
}
