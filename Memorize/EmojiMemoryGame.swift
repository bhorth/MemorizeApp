//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Brayden Horth on 2023-10-28.
//

import SwiftUI

//this is the view model

@Observable
class EmojiMemoryGame {
    
    private static let emojis = ["😀", "😇", "😍", "😎", "😜", "😟", "🥳", "🤢", "🤮", "🤥"]
    
    static func createMemoryGame() -> MemoryGame<String>{
        return MemoryGame(numberOfPairOfCards: 9) { pairIndex in
            if emojis.indices.contains(pairIndex){
                return emojis[pairIndex]
            }
            else{
                return "⁉️"
            }
        }
    }
    
    private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    //MARK: - Intents
    
    func shuffle(){
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
