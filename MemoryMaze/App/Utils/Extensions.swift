//
//  Extensions.swift
//  MemoryMaze
//
//  Created by Diggo Silva on 15/01/25.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach({ addSubview($0) })
    }
    
    func createButton(tag: Int, addTarget: Selector) -> UIButton {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = DSColor.secondaryColor
        btn.setImage(UIImage(systemName: "swift")?.withTintColor(DSColor.primaryColor, renderingMode: .alwaysOriginal), for: .normal)
        btn.setTitle("", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 50)
        btn.tag = tag
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: addTarget, for: .touchUpInside)
        applyShadow(view: btn)
        return btn
    }
    
    func createStack(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis = .horizontal) -> UIStackView {
        let sv = UIStackView(arrangedSubviews: arrangedSubviews)
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = axis
        sv.spacing = 20
        sv.distribution = .fillEqually
        return sv
    }
    
    func applyShadow(view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 5, height: 5)
        view.layer.shadowOpacity = 0.5 // default 0.0
        view.layer.shadowRadius = 5.0 // default 3.0
    }
}

final class DSColor {
    static let primaryColor = UIColor.systemBackground
    static let secondaryColor  = UIColor.systemOrange
}


enum Emojis {
    case natal([String])
    case halloween([String])
    
    func emojis() -> [String] {
        switch self {
        case .natal(let emojis):
            return emojis
        case .halloween(let emojis):
            return emojis
        }
    }
}

// Definindo os arrays de emojis para cada tema
let natalEmojis = Emojis.natal(["🎄", "🎅", "❄️", "⛄", "🎁", "🌟", "🕯️", "🍪"])
let halloweenEmojis = Emojis.halloween(["🎃", "👻", "🕸️", "🕷️", "💀", "🧛‍♂️", "🧙‍♀️", "🧟‍♀️"])
