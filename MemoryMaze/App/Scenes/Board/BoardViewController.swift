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
        setDelegatesAndDataSources()
    }
    
    private func setNavBar() {
        title = "Jogo da Memória"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Ranking", style: .done, target: self, action: #selector(goToRanking))
    }
    
    @objc private func goToRanking() {
        let rankingVC = RankingViewController()
        navigationController?.pushViewController(rankingVC, animated: true)
    }
    
    private func setDelegatesAndDataSources() {
        boardView.delegate = self
    }
}

extension BoardViewController: BoardViewDelegate {
    func flipCardUp(_ button: UIButton) {
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .curveEaseInOut]
        
        UIView.transition(with: button, duration: 0.6, options: transitionOptions) {
            button.backgroundColor = DSColor.secondaryColor
            button.setImage(nil, for: .normal)
            button.setTitle(self.boardView.emojis[button.tag - 1], for: .normal)
            button.layer.borderWidth = 2
            button.layer.borderColor = DSColor.primaryColor.cgColor
            button.isEnabled = false
        }
        boardView.flipped2Cards.append(button)
        
        if boardView.flipped2Cards.count == 2 {
            checkForMatch()
        }
    }
    
    func checkForMatch() {
        boardView.flipped2Cards.first?.currentTitle == boardView.flipped2Cards.last?.currentTitle ? isMatch() : isNotMatch()
        boardView.flipped2Cards = []
    }
    
    func isMatch() {
        boardView.matchedPairs += 1
        checkIfGameEnded()
        animateAlpha(alpha: 0)
        boardView.score += 200
        boardView.scoreLabel.text = "Pontos: \(boardView.score)"
    }
    
    func checkIfGameEnded() {
        if boardView.matchedPairs == boardView.totalButtons.count / 2 {
            registerScoreAlert()
        } else {
            boardView.resetButton.isHidden = true
        }
    }
    
    func isNotMatch() {
        flipCardDown()
        boardView.score -= 40
        boardView.scoreLabel.text = "Pontos: \(boardView.score)"
    }
    
    func flipCardDown() {
        guard let firstCard = boardView.flipped2Cards.first, let secondCard = boardView.flipped2Cards.last else { return }
        
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromLeft, .curveEaseInOut]
        let image = DSImage.defaultImage ?? UIImage()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.applyFlipTransition(for: firstCard, with: image, transitionOptions: transitionOptions)
            self.applyFlipTransition(for: secondCard, with: image, transitionOptions: transitionOptions)
        }
    }
    
    func applyFlipTransition(for card: UIButton, with image: UIImage, transitionOptions: UIView.AnimationOptions) {
        UIView.transition(with: card, duration: 0.6, options: transitionOptions) {
            card.backgroundColor = DSColor.primaryColor
            card.setImage(DSImage.defaultImage, for: .normal)
            card.setTitle("", for: .normal)
            card.isEnabled = true
        }
    }
    
    func animateAlpha(alpha: CGFloat) {
        UIView.animate(withDuration: 1.5) {
            UIView.animate(withDuration: 0.5) {
                self.boardView.flipped2Cards.first?.alpha = alpha
                self.boardView.flipped2Cards.last?.alpha = alpha
            }
        }
    }
    
    func resetGame() {
        let transitionOptions: UIView.AnimationOptions = [.transitionCurlDown, .curveEaseInOut]
        
        for (_, button) in boardView.totalButtons.enumerated() {
            UIView.transition(with: button, duration: 0.6, options: transitionOptions) {
                button.setImage(DSImage.defaultImage, for: .normal)
                button.setTitle("", for: .normal)
                button.alpha = 1
                button.isEnabled = true
                button.backgroundColor = DSColor.primaryColor
            }
        }
        boardView.flipped2Cards = []
        boardView.emojis = []
        boardView.score = 0
        boardView.matchedPairs = 0
        boardView.scoreLabel.text = "Pontos: 0"
        boardView.shuffledEmojis()
        boardView.resetButton.isHidden = true
    }
    
    private func registerScoreAlert() {
        let alert = UIAlertController(title: "Parabéns!", message: "Digite seu nome para salvar seus pontos.", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Digite seu nome"
            textField.autocapitalizationType = .words
        }

        let ok = UIAlertAction(title: "Ok", style: .default) { action in
            if let namePlayer = alert.textFields?.first?.text, !namePlayer.trimmingCharacters(in: .whitespaces).isEmpty {
                print("Nome do jogador: \(namePlayer), Pontos: \(self.boardView.score)")
                let rankingVC = RankingViewController()
                self.navigationController?.pushViewController(rankingVC, animated: true)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    rankingVC.viewModel.saveScorePlayer(name: namePlayer, score: self.boardView.score)
                    rankingVC.rankingView.tableView.reloadData()
                }
                self.boardView.resetButton.isHidden = false
            } else {
                self.alert()
            }
        }
        alert.addAction(ok)
        present(alert, animated: true)
    }
    
    private func alert() {
        let alert = UIAlertController(title: "Atenção! ⚠️", message: "Digite seu nome para salvar seus pontos.", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Entendi", style: .default) { action in
            self.registerScoreAlert()
        }
        alert.addAction(ok)
        present(alert, animated: true)
    }
}
