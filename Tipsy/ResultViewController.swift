//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Анастасия Рыбакова on 04.09.2023.
//

import UIKit
 
class ResultViewController: UIViewController {
    
// MARK: - User interFace
        private let darkColor = UIColor(red: 0.00, green: 0.69, blue: 0.42, alpha: 1.00)
        private let lightColor = UIColor(red: 0.84, green: 0.98, blue: 0.92, alpha: 1.00)
    
    private lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor = lightColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var topLabel = UILabel(text: "Total per person", size: 30, alignment: .center, textColor: .lightGray)
    
    private lazy var sumForPersonLabel = UILabel(text: "56.32", size: 45, alignment: .center, textColor: darkColor)
    
    private lazy var settingsLabel = UILabel(text: "Split between 2 people, with 10% tip.", size: 25, alignment: .center, textColor: .lightGray)
    
    
    
//MARK: - private properties
    var sumForPerson = ""
    var peopleNumber = 0
    var tipValue = 0
    
// MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupConstraints()
    
    }
}

extension ResultViewController {
    
    private func setupView() {

        sumForPersonLabel.text = sumForPerson
        settingsLabel.text = "Split between \(peopleNumber) people, with \(tipValue)% tip."

        
        view.backgroundColor = .white
        view.addSubview(topView)
        topView.addSubview(topLabel)
        topView.addSubview(sumForPersonLabel)
        sumForPersonLabel.font = .boldSystemFont(ofSize: 45)
        
        view.addSubview(settingsLabel)
    }
        
    private func setupConstraints() {
        let constraints: [NSLayoutConstraint] = [
            
            topView.heightAnchor.constraint(equalToConstant: 300),
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            topLabel.heightAnchor.constraint(equalToConstant: 36),
            topLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            topLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            topLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            
            sumForPersonLabel.heightAnchor.constraint(equalToConstant: 100),
            sumForPersonLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor),
            sumForPersonLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            sumForPersonLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            
            settingsLabel.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 50),
            settingsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            settingsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}


