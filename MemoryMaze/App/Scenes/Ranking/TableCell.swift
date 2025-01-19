//
//  TableCell.swift
//  MemoryMaze
//
//  Created by Diggo Silva on 19/01/25.
//

import UIKit

class TableCell: UITableViewCell {
    
    static let identifier = "TableCell"
    
    lazy var imageGame: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "swift")?.withTintColor(DSColor.primaryColor, renderingMode: .alwaysOriginal)
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var rankPositionLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "1"
        lbl.font = .monospacedSystemFont(ofSize: 16, weight: .regular)
        return lbl
    }()
    
    lazy var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Diggo"
        lbl.font = .monospacedSystemFont(ofSize: 16, weight: .semibold)
        return lbl
    }()
    
    lazy var scoreLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "1234"
        lbl.font = .monospacedSystemFont(ofSize: 16, weight: .bold)
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func configure(player: Player) {
        nameLabel.text = player.name
        scoreLabel.text = "\(player.score)"
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        backgroundColor = DSColor.secondaryColor
        addSubviews([imageGame, rankPositionLabel, nameLabel, scoreLabel])
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageGame.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageGame.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageGame.widthAnchor.constraint(equalToConstant: 25),
            imageGame.heightAnchor.constraint(equalTo: imageGame.widthAnchor),
            
            rankPositionLabel.centerYAnchor.constraint(equalTo: imageGame.centerYAnchor),
            rankPositionLabel.leadingAnchor.constraint(equalTo: imageGame.trailingAnchor, constant: 10),
            
            nameLabel.centerYAnchor.constraint(equalTo: rankPositionLabel.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: rankPositionLabel.trailingAnchor, constant: 10),
            
            scoreLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
}
