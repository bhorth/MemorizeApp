//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Brayden Horth on 2023-10-28.
//

import Foundation

//the model
struct MemoryGame<CardContent> {
    
    private(set) var cards: Array<Card>
    
    init(numberOfPairOfCards: Int, cardContentFactory: (Int) -> CardContent){
        
        cards = []
        
        for pairIndex in 0..<max(2,numberOfPairOfCards){
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card: Card){
        
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    struct Card {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
    }
}
