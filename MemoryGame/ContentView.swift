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
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojies[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
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
                shape.strokeBorder(lineWidth: 3)
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
