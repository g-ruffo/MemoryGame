//
//  CardView.swift
//  MemoryGame
//
//  Created by Grayson Ruffo on 2023-01-14.
//

import SwiftUI

struct CardView: View {
    let card: Card<String>
    
    @State private var animatedBonusRemaining: Double = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Group {
                    if card.isConsumingBonusTime {
                        Pie(startAngle: Angle(degrees: 0 - 90), endAngle: Angle(degrees: ( 1 - animatedBonusRemaining ) * 360 - 90))
                            .onAppear {
                                animatedBonusRemaining = card.bonusRemaining
                                withAnimation(.linear(duration: card.bonusTimeRemaining)) {
                                    animatedBonusRemaining = 0
                                }
                            }
                        
                    } else {
                        Pie(startAngle: Angle(degrees: 0 - 90), endAngle: Angle(degrees: ( 1 - card.bonusRemaining ) * 360 - 90))
                        
                    }
                }
                .padding(5)
                .opacity(DrawingConstants.circleTimerOpacity)
                
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
