//
//  BoardViewController.swift
//  MemoryMaze
//
//  Created by Diggo Silva on 15/01/25.
//

import UIKit

class BoardViewController: UIViewController {
    
    let boardView = BoardView()
    
    override func loadView() {
        super.loadView()
        view = boardView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

class BoardView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        backgroundColor = DSColor.primaryColor
        addSubviews([])
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: centerXAnchor),
            centerYAnchor.constraint(equalTo: centerYAnchor),
            leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            heightAnchor.constraint(equalToConstant: 110),
            
            bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            centerXAnchor.constraint(equalTo: centerXAnchor),
            widthAnchor.constraint(equalToConstant: 150),
            heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
