//
//  ViewController.swift
//  Tipsy
//
//  Created by Анастасия Рыбакова on 04.09.2023.
//

import UIKit

class CalculateViewController: UIViewController {

// MARK: - User interFace
    private let darkColor = UIColor(red: 0.00, green: 0.69, blue: 0.42, alpha: 1.00)
    private let lightColor = UIColor(red: 0.84, green: 0.98, blue: 0.92, alpha: 1.00)
    
    private lazy var topLabel = UILabel(text: "Enter bill total", size: 25, alignment: .left, textColor: .lightGray)
    
    private lazy var billTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .decimalPad
        textField.borderStyle = .none
        textField.font = .systemFont(ofSize: 40)
        textField.textColor = .lightGray
        textField.textAlignment = .center
        textField.placeholder = "e.g. 123.56"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = lightColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var mainStackView = UIStackView(axis: .vertical, distribution: .fill, subViews: [selectTipLabel, tipButtonStack, chooseSplitLabel, personsStackView])
    
    private lazy var selectTipLabel = UILabel(text: "Select tip", size: 25, alignment: .left, textColor: .lightGray)
    private lazy var chooseSplitLabel = UILabel(text: "Choose Split", size: 25, alignment: .left, textColor: .lightGray)
    
    
    
    private lazy var tipButtonStack = UIStackView(axis: .horizontal, distribution: .fillEqually, subViews: [zeroPrcTipButton, tenPrcTipButton, twentyPrcTipButton])
    
    private lazy var zeroPrcTipButton = UIButton(title: "0%", textColor: darkColor, backgroundColor: lightColor)
    private lazy var tenPrcTipButton = UIButton(title: "10%", textColor: darkColor, backgroundColor: lightColor)
    private lazy var twentyPrcTipButton = UIButton(title: "20%", textColor: darkColor, backgroundColor: lightColor)
    
    
    private lazy var personsStackView = UIStackView(axis: .horizontal, distribution: .fillEqually, subViews: [personNumberLabel, personStepper])

    private lazy var personNumberLabel = UILabel(text: "2", size: 35, alignment: .center, textColor: darkColor)
    
    private lazy var personStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.value = 2
        stepper.maximumValue = 25
        stepper.minimumValue = 2
        stepper.stepValue = 1
        stepper.tintColor = darkColor
        stepper.translatesAutoresizingMaskIntoConstraints = false
        
        stepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
        return stepper
    }()
    
    private lazy var calculateButton = UIButton(title: "Calculate", textColor: lightColor, backgroundColor: darkColor)
    
    
// MARK: - private properties
    private var totalBill = 0.0
    private var tipSize = 0.0
    private var personNumber = 2
    private var sumForPerson = 0.0
    
// MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyBoard()
        self.setupView()
        self.setupConstraints()
        
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(topLabel)
        view.addSubview(billTextField)
        view.addSubview(mainView)
        mainView.addSubview(mainStackView)
        view.addSubview(calculateButton)
        
        tenPrcTipButton.backgroundColor = darkColor
        tenPrcTipButton.setTitleColor(lightColor, for: .normal)
        
        zeroPrcTipButton.addTarget(self, action: #selector(didTapTipButton), for: .touchUpInside)
        tenPrcTipButton.addTarget(self, action: #selector(didTapTipButton), for: .touchUpInside)
        twentyPrcTipButton.addTarget(self, action: #selector(didTapTipButton), for: .touchUpInside)
        
        calculateButton.addTarget(self, action: #selector(didTapCalculateButton), for: .touchUpInside)
        
    }
    
    
    @objc private func didTapTipButton(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        switch sender {
        case zeroPrcTipButton: tipSize = 0.0
        case tenPrcTipButton: tipSize = 0.1
        case twentyPrcTipButton: tipSize = 0.2
        default: tipSize = 0.0
        }

        let buttons = [zeroPrcTipButton, tenPrcTipButton, twentyPrcTipButton]
        
        for button in buttons {
//            button.isSelected = false
            button.backgroundColor = lightColor
            button.setTitleColor(darkColor, for: .normal)
        }
        
//        sender.isSelected = true
        sender.backgroundColor = darkColor
        sender.setTitleColor(lightColor, for: .normal)
    }
    
    
    @objc private func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        personNumber = Int(sender.value)
        personNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @objc private func didTapCalculateButton(_ sender: UIButton) {
        totalBill = Double(billTextField.text ?? "") ?? 0.0
        sumForPerson = totalBill*(1+tipSize)/Double(personNumber)
        print(sumForPerson, tipSize, personNumber)
        
        let resultVS = ResultViewController()
        resultVS.sumForPerson = String(format: "%.2f", sumForPerson)
        resultVS.tipValue = Int(tipSize*100)
        resultVS.peopleNumber = personNumber

        self.present(resultVS, animated: true)
    }

    
    
    // MARK: method that hides keyBoard when tap on the view
    private func hideKeyBoard() {
        let backGroundTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapBackground))
        view.addGestureRecognizer(backGroundTapGesture)
    }
    
    @objc private func didTapBackground() {
        view.endEditing(true)
    }


}


extension CalculateViewController {
        
    private func setupConstraints() {
        let constraints: [NSLayoutConstraint] = [
            
            topLabel.heightAnchor.constraint(equalToConstant: 30),
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            topLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            topLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 50),
            
            billTextField.heightAnchor.constraint(equalToConstant: 50),
            billTextField.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 20),
            billTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            billTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            
            mainView.topAnchor.constraint(equalTo: billTextField.bottomAnchor, constant: 40),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20),
            mainStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            
            calculateButton.heightAnchor.constraint(equalToConstant: 50),
            calculateButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
            calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

//            selectTipLabel.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 30),
//            tipButtonStack.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
//            chooseSplitLabel.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 30),
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

