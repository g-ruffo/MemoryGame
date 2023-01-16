//
//  Cardify.swift
//  MemoryGame
//
//  Created by Grayson Ruffo on 2023-01-15.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    
    init(isFaceUp: Bool){
        rotation = isFaceUp ? 0 : 180
    }
    
    var animatableData: Double {
        get{ rotation }
        set{ rotation = newValue }
    }
    
    var rotation: Double // in degrees
    
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            if rotation < 90 {
                shape.fill().foregroundColor(Color.white)
                shape.strokeBorder(lineWidth: DrawingConstants.strokeCardBorder)
            } else{
                shape.fill()
            }
            content
                .opacity(rotation < 90 ? 1 : 0)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (x: 0, y: 1, z: 0))
    }
}


