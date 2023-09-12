//
//  UIKit+Extensions.swift
//  Tipsy
//
//  Created by Анастасия Рыбакова on 04.09.2023.
//

import UIKit



extension UILabel {
    convenience init(text: String, size: CGFloat, alignment: NSTextAlignment, textColor: UIColor) {
        self.init()
        self.text = text
        self.font = .systemFont(ofSize: size)
        self.textAlignment = alignment
        self.textColor = textColor
        self.numberOfLines = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIStackView {
    convenience init(
        axis: NSLayoutConstraint.Axis,
        distribution: UIStackView.Distribution,
        subViews: [UIView]) {
            self.init(arrangedSubviews: subViews)
//            self.backgroundColor = .red.withAlphaComponent(0.5)
            self.axis = axis
            self.distribution = distribution
            self.spacing = 25
            self.translatesAutoresizingMaskIntoConstraints = false
        }
}

extension UIButton {
    convenience init(title: String, textColor: UIColor, backgroundColor: UIColor) {
        self.init(type: .system)

        self.setTitle(title, for: .normal)
        self.tintColor = textColor
        self.backgroundColor = backgroundColor

      
        self.layer.cornerRadius = 5
        self.titleLabel?.font = .systemFont(ofSize: 35)
        self.titleLabel?.textAlignment = .center
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

