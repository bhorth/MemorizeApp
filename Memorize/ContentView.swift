//
//  ContentView.swift
//  Memorize
//
//  Created by Brayden Horth on 2023-10-28.
//

import SwiftUI

struct ContentView: View {
    
    let faceTheme: [String] = ["😀", "😇", "😍", "😎", "😜", "😀", "😇", "😍", "😎", "😜", "😟", "😟"].shuffled()
    
    let fruitTheme: [String] = ["🍎", "🍐", "🍊", "🍌", "🍉","🍎", "🍐", "🍊", "🍌", "🍉", "🍒", "🍒",].shuffled()
    
    let sportTheme: [String] = ["⚽️", "🏀", "🏈", "⚾️", "🏐", "⚽️", "🏀", "🏈", "⚾️", "🏐", "🎾", "🎾"].shuffled()
    
    @State var emojis: [String]
    @State var cardColor: Color = .orange
    
    init(){
        self.emojis = faceTheme
    }
    
    var body: some View {
        VStack {
            Text("Memorize").font(.largeTitle).fontWeight(.bold)
            ScrollView{
                cards
            }
            cardTheme
        }
        .padding()
    }
    
    var cardTheme: some View{
        HStack {
            facesThemeButton
            Spacer()
            fruitThemeButton
            Spacer()
            sportsThemeButton
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
            ForEach(0..<emojis.count, id: \.self){ index in
                CardView(content: emojis[index])
                    .aspectRatio(3/4, contentMode: .fit)
            }
        }
        .foregroundColor(cardColor)
    }
    
    func cardThemeAdjuster(theme: [String], color: Color, symbol: String, text: String) -> some View {
        Button(action: {
            emojis = theme.shuffled()
            cardColor = color
        }, label: {
            VStack{
                Image(systemName: symbol)
                Text(text)
            }
            .font(.title)
            
        })
    }
    
    var facesThemeButton: some View {
        cardThemeAdjuster(theme: faceTheme, color: .orange, symbol: "face.smiling", text: "Faces")
    }
    
    var fruitThemeButton: some View {
        cardThemeAdjuster(theme: fruitTheme, color: .pink, symbol: "fork.knife.circle", text: "Fruits")
    }
    
    var sportsThemeButton: some View {
        cardThemeAdjuster(theme: sportTheme, color: .cyan, symbol: "soccerball", text: "Sports")
    }
    
    
}

struct CardView: View {
    let content: String
    //Views are immutable
    @State var isFaceUp: Bool = false
    
    var body: some View{
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
