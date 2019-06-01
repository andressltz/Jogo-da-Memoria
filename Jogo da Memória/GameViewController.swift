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
    @IBOutlet weak var youWinLabel: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    //    var emojis: Array<Strings> = ["", ""]
//    var emojisOptions = ["🐶", "🐱", "🐸", "🐭", "🐮", "🐷"]
    
    @IBOutlet var buttonArray: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    var cardProvider: CardTextProvider!
    
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
        
        var hasCard = false
        
        for index in game.cards.indices {
            let button = self.buttonArray[index]
            let card = self.game.cards[index]
            
            let state = card.cardState
            
            if state == CardState.front {
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                button.setTitle(cardProvider.text(for: card.identifier), for: .normal)
            } else if state == CardState.matched{
                button.isHidden = true
//                button.backgroundColor = .clear
//                button.setTitle( " ", for: .normal)
            } else {
                button.backgroundColor = #colorLiteral(red: 1, green: 0.5238200164, blue: 0.1280178063, alpha: 1)
                button.setTitle(" ", for: .normal)
            }
            
            if card.isMatched == false {
                hasCard = true
            }
        }
        
        if !hasCard {
//            self.navigationController?.pushViewController(WelcomeViewController(), animated: false)
//            self.navigationController?.show(WelcomeViewController(), sender: nil)
//            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let endGameViewController = storyBoard.instantiateViewController(withIdentifier: "endGame") as! EndGameViewController
//            self.present(endGameViewController, animated: true, completion: nil)
//            self.navigationController?.pushViewController(EndGameViewController(), animated: false)
            
            youWinLabel.isHidden = false
            playAgainButton.isHidden = false
            flipCountLabel.isHidden = true
        }
    }
    
    @IBAction func playAgain(_ sender: UIButton) { self.navigationController?.popToRootViewController(animated: true)
        //        self.performSegue(withIdentifier: "restart-game", sender: nil)
    }
    
}

