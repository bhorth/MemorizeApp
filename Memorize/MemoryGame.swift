//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Brayden Horth on 2023-10-28.
//

import Foundation

//the model
struct MemoryGame<CardContent> where CardContent: Equatable{
    
    private(set) var cards: Array<Card>
    
    init(numberOfPairOfCards: Int, cardContentFactory: (Int) -> CardContent){
        
        cards = []
        
        for pairIndex in 0..<max(2,numberOfPairOfCards){
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)"))
        }
    }
    
    mutating func choose(_ card: Card){
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
    }
    
    func index(of card: Card) -> Int{
        for index in cards.indices{
            if cards[index].id == card.id{
                return index
            }
        }
        return 0
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable{
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
        var id: String
    }
}
