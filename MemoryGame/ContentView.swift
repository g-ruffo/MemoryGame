//
//  ContentView.swift
//  MemoryGame
//
//  Created by Grayson Ruffo on 2023-01-09.
//

import SwiftUI

struct ContentView: View {
    var emojies: Array<String> = ["😄", "😜", "😍", "🥸", "😡", "🤯", "😱", "😰", "😓", "🥵", "🥺", "🤒", "😵‍💫", "🤢", "🤮", "😴", "🥶"]
    
    @State var emojiCount: Int = 6
    
    var body: some View {
        return VStack {
            HStack {
                
                ForEach(emojies[0..<emojiCount], id: \.self) { emoji in
                    CardView(content: emoji)

                }
            }
            .padding(.horizontal)
                .foregroundColor(.red)
            
            HStack {
                
                remove
                
                Spacer()
            
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojies.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
            
        } label: {
            Image(systemName: "minus.circle")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = false
    var content: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(Color.white)
                shape.stroke(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else{
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
