//
//  ViewController.swift
//  TruthOrDate
//
//  Created by Emir Alkal on 14.12.2022.
//

import UIKit

class ViewController: UIViewController {

    var textFieldarray = [
        DCTextField(frame: .zero),
        DCTextField(frame: .zero)
    ]
    
    let stackView       = UIStackView()
    let addPeopleButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        configureView()
        configureStackView()
        configureTextFields()
    }
    
    private func configureView() {
        let tapGesture = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func configureStackView() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    private func configureTextFields() {
        for textField in textFieldarray {
            stackView.addArrangedSubview(textField)
        }
        configureAddPeopleButton()
        stackView.addArrangedSubview(addPeopleButton)
    }
    
    private func configureAddPeopleButton() {
        addPeopleButton.translatesAutoresizingMaskIntoConstraints = false
        addPeopleButton.setTitle("Add People", for: .normal)
        
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 21, weight: .heavy, scale: .default)
        let largeBoldDoc = UIImage(systemName: "plus", withConfiguration: largeConfig)
        
        addPeopleButton.setImage(largeBoldDoc, for: .normal)
        addPeopleButton.tintColor = .white
        addPeopleButton.titleLabel?.font = .systemFont(ofSize: 28)
        addPeopleButton.configuration = .plain()
        addPeopleButton.configuration?.imagePadding = 10
        addPeopleButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        addPeopleButton.addTarget(self, action: #selector(addTextField), for: .touchUpInside)
    }
    
    @objc func addTextField() {
        let newTextField = DCTextField(frame: .zero)
        textFieldarray.append(newTextField)
        
        stackView.insertArrangedSubview(newTextField, at: stackView.arrangedSubviews.count - 1)
    }
}

