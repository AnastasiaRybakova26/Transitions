//
//  ResultViewController.swift
//  BMICalculator
//
//  Created by Анастасия Рыбакова on 31.08.2023.
//

import UIKit

class ResultViewController: UIViewController {

// MARK: - UI
    private lazy var backgroungImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "result_background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var mainStackView = UIStackView()
    private let recalculateButton = UIButton(isBackgroundWhite: true)
    
    
    private let titleLabel = UILabel(text: "YOUR RESULT", size: 35, weight: .bold)
    private let resultLabel = UILabel(text: "19.5", size: 80, weight: .bold)
    private let descrLabel = UILabel(text: "EAT MORE SNACKS!", size: 20, weight: .light)

    
// MARK: - Pablic properties
    var bmiValue: String?
    var advice: String?
    var backgroundColor: UIColor?
    
// MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupConstraints()
    }
    
    private func setupView() {
        self.resultLabel.text = bmiValue
        self.descrLabel.text = advice
        view.backgroundColor = backgroundColor
        
        mainStackView = UIStackView(
            axis: .vertical,
            distribution: .fill,
            subViews: [titleLabel, resultLabel, descrLabel])
        
        view.addSubview(backgroungImageView)
        view.addSubview(mainStackView)
        view.addSubview(recalculateButton)
        
        recalculateButton.addTarget(self, action: #selector(recalculateButtonTapped(_:)), for: .touchUpInside )
    }
    
    @objc private func recalculateButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}


// MARK: - Extensions
extension ResultViewController {
    private func setupConstraints() {
        
        let constraints: [NSLayoutConstraint] = [
            backgroungImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroungImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroungImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroungImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            recalculateButton.heightAnchor.constraint(equalToConstant: 50),
            recalculateButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            recalculateButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            recalculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}


