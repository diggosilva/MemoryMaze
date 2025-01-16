//
//  BoardView.swift
//  MemoryMaze
//
//  Created by Diggo Silva on 16/01/25.
//

import UIKit

class BoardView: UIView {
    lazy var scoreLabel = createLabelScore()
    
    lazy var button1 = createButton(tag: 1, addTarget: #selector(buttonTapped))
    lazy var button2 = createButton(tag: 2, addTarget: #selector(buttonTapped))
    lazy var button3 = createButton(tag: 3, addTarget: #selector(buttonTapped))
    lazy var button4 = createButton(tag: 4, addTarget: #selector(buttonTapped))
    lazy var HStack1 = createStack(arrangedSubviews: [button1, button2, button3, button4])
    
    lazy var button5 = createButton(tag: 5, addTarget: #selector(buttonTapped))
    lazy var button6 = createButton(tag: 6, addTarget: #selector(buttonTapped))
    lazy var button7 = createButton(tag: 7, addTarget: #selector(buttonTapped))
    lazy var button8 = createButton(tag: 8, addTarget: #selector(buttonTapped))
    lazy var HStack2 = createStack(arrangedSubviews: [button5, button6, button7, button8])
    
    lazy var button9 = createButton(tag: 9, addTarget: #selector(buttonTapped))
    lazy var button10 = createButton(tag: 10, addTarget: #selector(buttonTapped))
    lazy var button11 = createButton(tag: 11, addTarget: #selector(buttonTapped))
    lazy var button12 = createButton(tag: 12, addTarget: #selector(buttonTapped))
    lazy var HStack3 = createStack(arrangedSubviews: [button9, button10, button11, button12])
    
    lazy var button13 = createButton(tag: 13, addTarget: #selector(buttonTapped))
    lazy var button14 = createButton(tag: 14, addTarget: #selector(buttonTapped))
    lazy var button15 = createButton(tag: 15, addTarget: #selector(buttonTapped))
    lazy var button16 = createButton(tag: 16, addTarget: #selector(buttonTapped))
    lazy var HStack4 = createStack(arrangedSubviews: [button13, button14, button15, button16])
    
    lazy var VStack = createStack(arrangedSubviews: [HStack1, HStack2, HStack3, HStack4], axis: .vertical)
    
    lazy var heightButtons: CGFloat = CGFloat(VStack.arrangedSubviews.count) * 110
    lazy var buttons: [UIButton] = [button1, button2, button3, button4, button5, button6, button7, button8]
    
    lazy var resetButton = createResetButton()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonTapped(_ button: UIButton) {
        print("Botão \(button.tag)")
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        backgroundColor = DSColor.primaryColor
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
