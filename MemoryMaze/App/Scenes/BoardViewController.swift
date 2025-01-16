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
        setNavBar()
    }
    
    func setNavBar() {
        title = "Jogo da Memória"
    }
}
