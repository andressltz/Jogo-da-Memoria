//
//  Extensions.swift
//  Jogo da Memória
//
//  Created by Ândres Schultz on 25/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

extension Bool {
    
    mutating func toogle() {
        self = !self
    }
    
}

extension Array {
    
    mutating func getRandomAndDelete() -> Element {
        let index = Int.random(in: self.indices)
        return self.remove(at: index)
    }
    
}
