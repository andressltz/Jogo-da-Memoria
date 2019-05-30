//
//  WelcomeViewController.swift
//  Jogo da Memória
//
//  Created by Ândres Schultz on 29/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let gameSegue = "show-game"
    
    var cardTextProvider: CardTextProvider?
    
    @IBAction func touchCuteAnimals(_ sender: UIButton) {
        self.cardTextProvider = CuteAnimalsEmojiProvider()
        self.performSegue(withIdentifier: gameSegue, sender: nil)
    }
    
    @IBAction func touchCuteMoons(_ sender: UIButton) {
        self.cardTextProvider = MoonEmojiProvider()
        self.performSegue(withIdentifier: gameSegue, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? GameViewController {
            destination.cardProvider = self.cardTextProvider
        }
        
    }
    
}
