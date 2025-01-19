//
//  BoardView.swift
//  MemoryMaze
//
//  Created by Diggo Silva on 16/01/25.
//

import UIKit

protocol BoardViewDelegate: AnyObject {
    func flipCardUp(_ button: UIButton)
    func checkForMatch()
    func isMatch()
    func checkIfGameEnded()
    func isNotMatch()
    func flipCardDown()
    func applyFlipTransition(for card: UIButton, with image: UIImage, transitionOptions: UIView.AnimationOptions)
    func animateAlpha(alpha: CGFloat)
    func resetGame()
}

class BoardView: UIView {
    lazy var scoreLabel = createLabelScore()
    lazy var VStack = createStack(arrangedSubviews: [], axis: .vertical)
    lazy var resetButton = createResetButton(addTarget: #selector(resetGame))
    lazy var heightButtons: CGFloat = CGFloat(lines) * 110
    
    var emojisDB: [String] = halloween.emojis()
    var emojis: [String] = []
    var flipped2Cards: [UIButton] = []
    var score: Int = 0
    var matchedPairs = 0
    var totalButtons: [UIButton] = []
    
    let lines = 4
    let columns = 4
    
    weak var delegate: BoardViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        shuffledEmojis()
        buildBoard()
        applyShadow(view: VStack)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func buildBoard() {
        var tag = 1
        
        for _ in 0..<lines {
            var buttons: [UIButton] = []
            
            for _ in 0..<columns {
                let btn = createButton(tag: tag, addTarget: #selector(flipCardUp))
                buttons.append(btn)
                totalButtons.append(btn)
                tag += 1
            }
            let HStacks = createStack(arrangedSubviews: buttons)
            VStack.addArrangedSubview(HStacks)
        }
    }
    
    func shuffledEmojis() {
        emojis = (emojisDB + emojisDB).shuffled()
        print(emojis)
    }
    
    @objc private func flipCardUp(_ button: UIButton) {
        delegate?.flipCardUp(button)
    }
    
    private func checkForMatch() {
        delegate?.checkForMatch()
    }
    
    private func isMatch() {
        delegate?.isMatch()
    }
    
    private func checkIfGameEnded() {
        delegate?.checkIfGameEnded()
    }
    
    private func isNotMatch() {
        delegate?.isNotMatch()
    }
    
    private func flipCardDown() {
        delegate?.flipCardDown()
    }
    
    private func applyFlipTransition(for card: UIButton, with image: UIImage, transitionOptions: UIView.AnimationOptions) {
        delegate?.applyFlipTransition(for: card, with: image, transitionOptions: transitionOptions)
    }
    
    private func animateAlpha(alpha: CGFloat) {
        delegate?.animateAlpha(alpha: alpha)
    }
    
    @objc private func resetGame() {
        delegate?.resetGame()
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        backgroundColor = DSColor.secondaryColor
        addSubviews([scoreLabel, VStack, resetButton])
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            scoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            VStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            VStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            VStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            VStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            VStack.heightAnchor.constraint(equalToConstant: heightButtons),
            
            resetButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            resetButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            resetButton.widthAnchor.constraint(equalToConstant: 150),
            resetButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
