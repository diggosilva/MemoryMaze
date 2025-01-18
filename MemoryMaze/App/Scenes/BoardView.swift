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
}

class BoardView: UIView {
    lazy var button1 = createButton(tag: 1, addTarget: #selector(flipCardUp))
    lazy var button2 = createButton(tag: 2, addTarget: #selector(flipCardUp))
    lazy var button3 = createButton(tag: 3, addTarget: #selector(flipCardUp))
    lazy var button4 = createButton(tag: 4, addTarget: #selector(flipCardUp))
    lazy var HStack1 = createStack(arrangedSubviews: [button1, button2, button3, button4])
    
    lazy var button5 = createButton(tag: 5, addTarget: #selector(flipCardUp))
    lazy var button6 = createButton(tag: 6, addTarget: #selector(flipCardUp))
    lazy var button7 = createButton(tag: 7, addTarget: #selector(flipCardUp))
    lazy var button8 = createButton(tag: 8, addTarget: #selector(flipCardUp))
    lazy var HStack2 = createStack(arrangedSubviews: [button5, button6, button7, button8])
    
    lazy var button9 = createButton(tag: 9, addTarget: #selector(flipCardUp))
    lazy var button10 = createButton(tag: 10, addTarget: #selector(flipCardUp))
    lazy var button11 = createButton(tag: 11, addTarget: #selector(flipCardUp))
    lazy var button12 = createButton(tag: 12, addTarget: #selector(flipCardUp))
    lazy var HStack3  = createStack(arrangedSubviews: [button9, button10, button11, button12])
    
    lazy var button13 = createButton(tag: 13, addTarget: #selector(flipCardUp))
    lazy var button14 = createButton(tag: 14, addTarget: #selector(flipCardUp))
    lazy var button15 = createButton(tag: 15, addTarget: #selector(flipCardUp))
    lazy var button16 = createButton(tag: 16, addTarget: #selector(flipCardUp))
    lazy var HStack4  = createStack(arrangedSubviews: [button13, button14, button15, button16])
    lazy var VStack = createStack(arrangedSubviews: [HStack1, HStack2, HStack3, HStack4], axis: .vertical)
    
    lazy var scoreLabel = createLabelScore()
    lazy var resetButton = createResetButton(addTarget: #selector(resetGame))
    
    lazy var heightButtons: CGFloat = CGFloat(VStack.arrangedSubviews.count) * 110
    lazy var buttons: [UIButton] = [button1, button2, button3, button4, button5, button6, button7, button8, button9, button10, button11, button12, button13, button14, button15, button16]
    lazy var emojis: [String] = []
    let emojisDB: [String] = halloween.emojis()
    
    var flipped2Cards: [UIButton] = []
    var score: Int = 0
    var matchedPairs = 0
    
    weak var delegate: BoardViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        shuffledEmojis()
        applyShadow(view: VStack)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func shuffledEmojis() {
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
        let transitionOptions: UIView.AnimationOptions = [.transitionCurlDown, .curveEaseInOut]
        
        for (_, button) in buttons.enumerated() {
            UIView.transition(with: button, duration: 0.6, options: transitionOptions) {
                button.setImage(UIImage(systemName: "swift")?.withTintColor(DSColor.secondaryColor, renderingMode: .alwaysOriginal), for: .normal)
                button.setTitle("", for: .normal)
                button.alpha = 1
                button.isEnabled = true
                button.backgroundColor = DSColor.primaryColor
            }
        }
        flipped2Cards = []
        emojis = []
        score = 0
        matchedPairs = 0
        scoreLabel.text = "Pontos: 0"
        shuffledEmojis()
        resetButton.isHidden = true
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
