//
//  Cardify.swift
//  MemoryGame
//
//  Created by Grayson Ruffo on 2023-01-15.
//

import SwiftUI

struct Cardify: ViewModifier {
    
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            if isFaceUp {
                shape.fill().foregroundColor(Color.white)
                shape.strokeBorder(lineWidth: DrawingConstants.strokeCardBorder)
            } else{
                shape.fill()
            }
            content
                .opacity(isFaceUp ? 1 : 0)
        }
    }
}


