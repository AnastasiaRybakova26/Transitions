//
//  VC_myVersion.swift
//  BMICalculator
//
//  Created by Анастасия Рыбакова on 31.08.2023.
//

import UIKit

class VC_myVersion: UIViewController {

// MARK: - User Interface
    
    private lazy var backgroungImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "calculate_background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
//        stackView.backgroundColor = .red.withAlphaComponent(0.5)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var bmiLabel: UILabel = {
        let label = UILabel()
        label.text = "CALCULATE YOUR BMI"
        label.textColor = .darkGray
        label.font = .boldSystemFont(ofSize: 40)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(red: 0.38, green: 0.38, blue: 0.62, alpha: 1.00)
        button.setTitle("CALCULATE", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.titleLabel?.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
// MARK: - Height information
    private lazy var heightLabel: UILabel = {
        let label = UILabel()
        label.text = "Height"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 17, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var heightValueLabel: UILabel = {
        let label = UILabel()
        label.text = "1,5m"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 17, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var heightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
//        stackView.backgroundColor = .blue.withAlphaComponent(0.5)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var heightSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 2
        slider.value = 1.5
        slider.thumbTintColor = UIColor(red: 0.38, green: 0.38, blue: 0.62, alpha: 0.5)
        slider.minimumTrackTintColor = UIColor(red: 0.38, green: 0.38, blue: 0.62, alpha: 0.5)
//        slider.maximumTrackTintColor = .systemGray6
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    
// MARK: - Weight imformation
    private lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.text = "Weight"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 17, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var weightValueLabel: UILabel = {
        let label = UILabel()
        label.text = "100kg"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 17, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var weightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
//        stackView.backgroundColor = .blue.withAlphaComponent(0.5)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var weightSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 30
        slider.maximumValue = 170
        slider.value = 100
        slider.thumbTintColor = UIColor(red: 0.38, green: 0.38, blue: 0.62, alpha: 0.5)
        slider.minimumTrackTintColor = UIColor(red: 0.38, green: 0.38, blue: 0.62, alpha: 0.5)
//        slider.maximumTrackTintColor = .systemGray6
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    
    
    
// MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupConstraints()
    }
    
    private func setupView() {
        view.addSubview(backgroungImageView)
        view.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(bmiLabel)
        mainStackView.addArrangedSubview(heightStackView)
        mainStackView.addArrangedSubview(heightSlider)
        mainStackView.addArrangedSubview(weightStackView)
        mainStackView.addArrangedSubview(weightSlider)
        mainStackView.addArrangedSubview(calculateButton)
        
        heightStackView.addArrangedSubview(heightLabel)
        heightStackView.addArrangedSubview(heightValueLabel)
        
        weightStackView.addArrangedSubview(weightLabel)
        weightStackView.addArrangedSubview(weightValueLabel)
        
    }
    
    


}


// MARK: - extensions

extension VC_myVersion {
    
    private func setupConstraints() {
        
        let constraints: [NSLayoutConstraint] = [
            backgroungImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroungImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroungImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroungImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
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





