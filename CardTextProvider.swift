//
//  CardTextProvider.swift
//  Jogo da Memória
//
//  Created by Ândres Schultz on 29/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

//protocol CardTextProvider: class {
protocol CardTextProvider: AnyObject {
    
    func text(for identifier: Int) -> String
    var emojis: [Int: String] { get set }
    var emojisOptions: [String] { get set }
}

extension CardTextProvider {
    
    func text(for identifier: Int) -> String {
        if let emoji = emojis[identifier] {
            return emoji
        }
        
        let emoji = emojisOptions.getRandomAndDelete()
        
        emojis[identifier] = emoji
        
        return emoji
        
    }
    
}

class CuteAnimalsEmojiProvider: CardTextProvider {
    
    var emojis = [Int: String]()
    var emojisOptions = ["🐶", "🐱", "🐸", "🐭", "🐮", "🐷"]
    
}

class MoonEmojiProvider: CardTextProvider {
    
    var emojis = [Int: String]()
    var emojisOptions = ["🌝", "🌚", "🌛", "🌜", "🌔", "🌘"]
    
}

