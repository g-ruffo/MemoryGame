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
                    Text(card.content)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(Animation.easeInOut)
                    .font(Font.system(size: DrawingConstants.fontSize))
                    .scaleEffect(scale(thatFits: geometry.size))
                }
            .cardify(isFaceUp: card.isFaceUp)
        }
        }
    
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
    }
            
}
