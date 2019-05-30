
//
//  Game.swift
//  Jogo da Memória
//
//  Created by Ândres Schultz on 25/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

class Game {
    
//    var cards: [Card] = []
    var cards: [Card] = [Card]()
    
    var indexOfSelectedCard: Int?
    
    func chooseCard(at index: Int) {
        if cards.indices.contains(index),
            cards[index].isMatched == false {
            
            if let matchedIndex = self.indexOfSelectedCard,
                index != matchedIndex {
                
                if cards[matchedIndex].identifier == cards[index].identifier {
                    cards[matchedIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceUp = true
                self.indexOfSelectedCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = cards[flipDownIndex].isMatched
                }
                
                cards[index].isFaceUp = true
                self.indexOfSelectedCard = index
            }
        
//            card.isFaceUp = !card.isFaceUp
//            if card.isFaceUp {
//                card.isFaceUp = false
//            } else {
//                card.isFaceUp = true
//            }
        }
    }
    
    init(numberOfPairOfCards: Int) {
        for index in 0..<numberOfPairOfCards {
            let card = Card(identifier: index)
//            let secondCard = Card(identifier: index)
            
//            self.cards.append(card)
//            self.cards.append(secondCard)
//            self.cards += [card, secondCard]
            
            self.cards += [card, card]
            cards.shuffle()
        }
    }
}

struct Card {
    
    var identifier: Int
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    var cardState: CardState {
        if isMatched {
            return .matched
        } else if isFaceUp {
            return .front
        } else {
            return .back
        }
    }
    
    init(identifier: Int) {
        self.identifier = identifier
    }
    
}

enum CardState {
    
    case back, front, matched
    
}
