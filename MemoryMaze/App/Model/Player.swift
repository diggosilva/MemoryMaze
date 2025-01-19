//
//  Player.swift
//  MemoryMaze
//
//  Created by Diggo Silva on 19/01/25.
//

import Foundation

class Player: Codable {
    var name: String
    var score: Int
    
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}
