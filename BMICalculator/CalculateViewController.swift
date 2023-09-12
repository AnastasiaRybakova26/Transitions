//
//  CalculateViewController.swift
//  BMICalculator
//
//  Created by Анастасия Рыбакова on 31.08.2023.
//

import UIKit

class CalculateViewController: UIViewController {

// MARK: - User Interface
    
    private lazy var backgroungImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "calculate_background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var mainStackView = UIStackView()
    
    private var heightStackView = UIStackView()
    private let heightTitleLabel = UILabel(text: "Height", alighment: .left)
    private let heightValueLabel = UILabel(text: "1,5m", alighment: .right)
    private let heightSlider = UISlider(minimumValue: 1, maximumValue: 2)
    
    private var weightStackView = UIStackView()
    private let weightTitleLabel = UILabel(text: "Weight", alighment: .left)
    private let weightValueLabel = UILabel(text: "100kg", alighment: .right)
    private let weightSlider = UISlider(minimumValue: 0, maximumValue: 200)
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "CALCULATE YOUR BMI"
        label.textAlignment = .left
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let calculateButton = UIButton(isBackgroundWhite: false)
    
    
// MARK: - Orivate roperties
    private var calculatirBrain = CalculatorBrain()
    
// MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupConstraints()
    }
    
    private func setupView() {
        
        heightStackView = UIStackView(
            axis: .horizontal,
            distribution: .equalSpacing,
            subViews: [heightTitleLabel, heightValueLabel]
        )
        
        weightStackView = UIStackView(
            axis: .horizontal,
            distribution: .equalSpacing,
            subViews: [weightTitleLabel, weightValueLabel])
        
        mainStackView = UIStackView(
            axis: .vertical,
            distribution: .fillProportionally,
            subViews: [titleLabel, heightStackView, heightSlider, weightStackView, weightSlider, calculateButton]
        )
        
        view.addSubview(backgroungImageView)
        view.addSubview(mainStackView)
        
        heightSlider.addTarget(self, action: #selector(heightSliderChanged), for: .valueChanged)
        weightSlider.addTarget(self, action: #selector(weightSliderChanged), for: .valueChanged)
        calculateButton.addTarget(self, action: #selector(calculateButtonTapped(_:)), for: .touchUpInside )
    }
    
    
    
    @objc private func heightSliderChanged(_ sender: UISlider) {
        heightValueLabel.text = String(format: "%.2f", sender.value) + "m"
    }
    
    @objc private func weightSliderChanged(_ sender: UISlider) {
        weightValueLabel.text = String(format: "%.0f", sender.value) + "kg"
    }
    
    @objc private func calculateButtonTapped(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        calculatirBrain.calculateBMI(height: height, weight: weight)
        
        let resultVC = ResultViewController()
        resultVC.bmiValue = calculatirBrain.getBMIValue
        resultVC.advice = calculatirBrain.getAdvice
        resultVC.backgroundColor = calculatirBrain.getColor
        
//        resultVC.modalTransitionStyle = .flipHorizontal
        resultVC.modalPresentationStyle = .fullScreen
        self.present(resultVC, animated: true)
    }
    


}


// MARK: - extensions

extension CalculateViewController {
    
    private func setupConstraints() {
        
        let constraints: [NSLayoutConstraint] = [
            backgroungImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroungImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroungImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroungImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            heightStackView.heightAnchor.constraint(equalToConstant: 20),
            heightSlider.heightAnchor.constraint(equalToConstant: 60),
            weightStackView.heightAnchor.constraint(equalToConstant: 20),
            weightSlider.heightAnchor.constraint(equalToConstant: 60),
            calculateButton.heightAnchor.constraint(equalToConstant: 50),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}





