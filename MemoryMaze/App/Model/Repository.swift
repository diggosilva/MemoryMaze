//
//  Repository.swift
//  MemoryMaze
//
//  Created by Diggo Silva on 19/01/25.
//

import UIKit

class Repository {
    let userDefaults = UserDefaults.standard
    let accessKey = "accessKey"
    var player: [Player] = [Player]()
    
    func loadPlayerList() -> [Player] {
        if let data = userDefaults.data(forKey: accessKey) {
            if let decodedPlayer = try? JSONDecoder().decode([Player].self, from: data) {
                return decodedPlayer
            }
        }
        return []
    }
    
    func save(player: Player) {
        var playerList = loadPlayerList()
        playerList.append(player)
        userDefaults.set(try? JSONEncoder().encode(playerList), forKey: accessKey)
    }
}