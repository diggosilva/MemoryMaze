class RankingViewModel {
    var rankingList: [Player] = [
        Player(name: "Jess", score: 440),
        Player(name: "Ivete", score: 520),
        Player(name: "Diggo", score: 480),
        Player(name: "Junior", score: 560),
        Player(name: "Pitoquinho", score: 600),
    ]
    
    func numberOfRowsInSection() -> Int {
        return rankingList.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> Player {
        rankingList = rankingList.sorted { $0.score > $1.score }
        return rankingList[indexPath.row]
    }
}
