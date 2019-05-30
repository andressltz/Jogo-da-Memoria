//
//  ViewController.swift
//  Jogo da Memória
//
//  Created by Ândres Schultz on 25/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    lazy var game = Game(numberOfPairOfCards: buttonArray.count / 2)
    
    //    var flipCount: Int = 0
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
//    var emojis: Array<Strings> = ["", ""]
//    var emojisOptions = ["🐶", "🐱", "🐸", "🐭", "🐮", "🐷"]
    
    @IBOutlet var buttonArray: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    let cardProvider: CardTextProvider = MoonEmojiProvider()
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber: Int = buttonArray.firstIndex(of: sender) {
//            flipCard(withEmoji: emojis[cardNumber], on: sender)
            
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            flipCount += 1
        }
    }
    
    func updateViewFromModel() {
//        for index in 0..<game.cards.count
//
//        zip(buttonArray, game.cards).forEach(<#T##body: ((UIButton, Card)) throws -> Void##((UIButton, Card)) throws -> Void#>) {
//
//        }

//        for (card, index) in game.cards.enumerated() {
//            
//        }
        
        for index in game.cards.indices {
            let button = self.buttonArray[index]
            let card = self.game.cards[index]
            
            let state = card.cardState
            
            if state == CardState.front {
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//                button.setTitle(emoji(for: card), for: .normal)
                button.setTitle(cardProvider.text(for: card.identifier), for: .normal)
            } else if state == CardState.matched{
                button.isHidden = true
//                button.backgroundColor = .clear
//                button.setTitle( " ", for: .normal)
            } else {
                button.backgroundColor = #colorLiteral(red: 1, green: 0.5238200164, blue: 0.1280178063, alpha: 1)
                button.setTitle(" ", for: .normal)
            }
            
//            if card.isFaceUp {
//                button.backgroundColor = card.isMatched ? .clear : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//                button.setTitle(card.isMatched ? " " : emoji(for: card), for: .normal)
//            } else {
//                button.backgroundColor = #colorLiteral(red: 1, green: 0.5238200164, blue: 0.1280178063, alpha: 1)
//                button.setTitle(" ", for: .normal)
//            }
        }
    }
    
//    var emojis: Dictionary<Int, String>
//    var emojis = [Int: String]()
    
//    func emoji(for card: Card) -> String {
//        if let emoji = emojis[card.identifier] {
//            return emoji
//        }
//
//        let emoji = emojisOptions.getRandomAndDelete()
//
////        let index = Int.random(in: emojisOptions.indices)
////        let emoji = emojisOptions.remove(at: index)
////        let emoji = emojisOptions.randomElement()
//
//        emojis[card.identifier] = emoji
//
//        return emoji
//    }
    
//    @IBAction func touchSecondCard(_ sender: UIButton) {
//        flipCard(withEmoji: "🐱", on: sender)
//
//        flipCount += 1
//    }
    
//    func flipCard(withEmoji emoji: String, on button: UIButton) {
//        print("touching card \(emoji)")
//        if button.currentTitle == emoji {
//            button.backgroundColor = #colorLiteral(red: 1, green: 0.5238200164, blue: 0.1280178063, alpha: 1) // UIColor.orange
//            button.setTitle("", for: .normal)
//        } else {
//            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//            button.setTitle(emoji, for: .normal)
//        }
//    }
    
}

