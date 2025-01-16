//
//  DSColor.swift
//  MemoryMaze
//
//  Created by Diggo Silva on 16/01/25.
//

import UIKit

final class DSColor {
    static let primaryColor = UIColor.systemBackground
    static let secondaryColor = UIColor.systemOrange
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
let natalEmojis = Emojis.natal(["🎄", "🎅", "❄️", "⛄", "🎁", "🌟", "🕯️", "🍪"])
let halloweenEmojis = Emojis.halloween(["🎃", "👻", "🕸️", "🕷️", "💀", "🧛‍♂️", "🧙‍♀️", "🧟‍♀️"])
