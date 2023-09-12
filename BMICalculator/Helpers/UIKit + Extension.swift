//
//  UIKit + Extension.swift
//  BMICalculator
//
//  Created by Анастасия Рыбакова on 31.08.2023.
//

import UIKit

extension UIStackView {
    convenience init(
        axis: NSLayoutConstraint.Axis,
        distribution: UIStackView.Distribution,
        subViews: [UIView]) {
            self.init(arrangedSubviews: subViews)
            self.axis = axis
            self.distribution = distribution
            self.spacing = 5
            self.translatesAutoresizingMaskIntoConstraints = false
        }
}



extension UILabel {
    convenience init(text: String, alighment: NSTextAlignment) {
        self.init()
        self.textAlignment = alighment
        self.text = text
        self.textColor = .darkGray
        self.font = .systemFont(ofSize: 17, weight: .light)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UILabel {
    convenience init(text: String, size: CGFloat, weight: UIFont.Weight) {
        self.init()
        self.text = text
        self.textAlignment = .center
        self.textColor = .white
        self.font = .systemFont(ofSize: size, weight: weight)
        self.numberOfLines = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}


extension UISlider {
    convenience init(minimumValue: Float, maximumValue: Float) {
        self.init()
        self.minimumValue = minimumValue
        self.maximumValue = maximumValue
        self.value = minimumValue+(maximumValue-minimumValue)/2
        self.thumbTintColor = UIColor(red: 0.38, green: 0.38, blue: 0.62, alpha: 0.5)
        self.minimumTrackTintColor = UIColor(red: 0.38, green: 0.38, blue: 0.62, alpha: 0.5)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIButton {
    convenience init(isBackgroundWhite: Bool) {
        self.init(type: .system)
        
        let title = isBackgroundWhite ? "RECALCULATE" : "CALCULATE"
        self.setTitle(title, for: .normal)
        
        let color = UIColor(red: 0.38, green: 0.38, blue: 0.62, alpha: 1.00)
        self.tintColor = isBackgroundWhite ? color : .white
        self.backgroundColor = isBackgroundWhite ? .white : color
      
    
        self.layer.cornerRadius = 10
        self.titleLabel?.font = .systemFont(ofSize: 20)
        self.titleLabel?.textAlignment = .center
        self.translatesAutoresizingMaskIntoConstraints = false
        

    }
}
