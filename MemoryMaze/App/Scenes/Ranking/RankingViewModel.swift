//
//  RankingViewModel.swift
//  MemoryMaze
//
//  Created by Diggo Silva on 19/01/25.
//

import Foundation

protocol RankingViewModelProtocol {
    func saveScorePlayer(name: String, score: Int)
    func numberOfRowsInSection() -> Int
    func cellForRowAt(indexPath: IndexPath) -> Player
    func loadPlayerList()
    var rankingList: [Player] { get }
    var rankingListTop6: [Player] { get }
}

class RankingViewModel: RankingViewModelProtocol {
    private var repository = Repository()
    var rankingList: [Player] = []
    var rankingListTop6: [Player] = []
    
    init(repository: Repository = Repository()) {
        self.repository = repository
    }
    
    func numberOfRowsInSection() -> Int {
        return rankingListTop6.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> Player {
        rankingListTop6 = rankingList.sorted { $0.score > $1.score }
        return rankingListTop6[indexPath.row]
    }
    
    func saveScorePlayer(name: String, score: Int) {
        let newPlayer = Player(name: name, score: score)
        rankingList.append(newPlayer)
        let top6 = rankingList.sorted { $0.score > $1.score }
        rankingListTop6 = Array(top6.prefix(6))
        repository.save(player: newPlayer)
    }
    
    func loadPlayerList() {
        rankingList = repository.loadPlayerList()
        let top6 = rankingList.sorted { $0.score > $1.score }
        rankingListTop6 = Array(top6.prefix(6))
    }
}
