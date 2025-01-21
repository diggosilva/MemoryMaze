//
//  Components+Ext.swift
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
        btn.backgroundColor = DSColor.primaryColor
        btn.setImage(DSImage.defaultImage, for: .normal)
        btn.setTitle("", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 50)
        btn.tag = tag
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: addTarget, for: .touchUpInside)
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
    
    func createResetButton(addTarget: Selector) -> UIButton {
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "Novo Jogo"
        configuration.baseBackgroundColor = DSColor.primaryColor
        configuration.baseForegroundColor = DSColor.secondaryColor
        configuration.cornerStyle = .capsule
        
        let btn = UIButton(configuration: configuration)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.isHidden = true
        btn.addTarget(self, action: addTarget, for: .touchUpInside)
        applyShadow(view: btn)
        return btn
    }
    
    func createLabelScore() -> UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Pontos: 0"
        lbl.font = .preferredFont(forTextStyle: .headline)
        return lbl
    }
    
    func applyShadow(view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 5, height: 5)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 5.0
    }
}
