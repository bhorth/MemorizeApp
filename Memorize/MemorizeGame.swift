//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Brayden Horth on 2023-10-28.
//

import Foundation

struct MemoryGame<CardContent> {
    
    var cards: Array<Card>
    
    func choose(card: Card){
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
