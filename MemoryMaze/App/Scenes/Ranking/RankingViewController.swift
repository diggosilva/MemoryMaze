//
//  RankingViewController.swift
//  MemoryMaze
//
//  Created by Diggo Silva on 19/01/25.
//

import UIKit

class RankingViewController: UIViewController {
    
    let rankingView = RankingView()
    let viewModel = RankingViewModel()
    
    override func loadView() {
        super.loadView()
        view = rankingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        setDelegatesAndDataSources()
    }
    
    private func setNavBar() {
        title = "Melhores pontuações"
    }
    
    private func setDelegatesAndDataSources() {
        rankingView.tableView.delegate = self
        rankingView.tableView.dataSource = self
        rankingView.tableView.reloadData()
    }
}

extension RankingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.identifier, for: indexPath) as? TableCell else { return UITableViewCell() }
        cell.rankPositionLabel.text = "\(indexPath.row + 1)"
        cell.configure(player: viewModel.cellForRowAt(indexPath: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
