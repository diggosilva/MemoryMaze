//
//  DSColor.swift
//  MemoryMaze
//
//  Created by Diggo Silva on 16/01/25.
//

import UIKit

final class DSColor {
    static let primaryColor = UIColor.systemOrange
    static let secondaryColor = UIColor.systemBackground
}


enum Emojis {
    case natal([String])
    case halloween([String])
    
    func emojis() -> [String] {
        switch self {
        case .natal(let emojis):
            return emojis
        case .halloween(let emojis):
            return emojis
        }
    }
}

// Definindo os arrays de emojis para cada tema
let natal = Emojis.natal(["🎄", "🎅", "❄️", "⛄", "🎁", "🌟", "🕯️", "🍪"])
let halloween = Emojis.halloween(["🎃", "👻", "🕸️", "🕷️", "💀", "🧛‍♂️", "🧙‍♀️", "🧟‍♀️"])
