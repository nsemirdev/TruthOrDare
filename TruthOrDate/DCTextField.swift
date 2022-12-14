//
//  DCTextField.swift
//  TruthOrDate
//
//  Created by Emir Alkal on 14.12.2022.
//

import UIKit

class DCTextField: UIView {

    static var userCount    = 0
    let textField           = UITextField()
    let label               = UILabel()
    let button              = UIButton(type: .system)
    let seperator           = UIView()
    var id: Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        DCTextField.userCount += 1
        id = DCTextField.userCount
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 75)
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        configureSeperator()
        configureTextField()
        configureButton()
        configureLabel()
    }
    
    private func configureSeperator() {
        seperator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(seperator)
        
        NSLayoutConstraint.activate([
            seperator.heightAnchor.constraint(equalToConstant: 1),
            seperator.leadingAnchor.constraint(equalTo: leadingAnchor),
            seperator.trailingAnchor.constraint(equalTo: trailingAnchor),
            seperator.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        seperator.backgroundColor = .white
    }
    
    private func configureTextField() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.tintColor = .white
        textField.textColor = .white
        textField.font = .systemFont(ofSize: 19, weight: .regular)
        textField.autocorrectionType = .no
        textField.attributedPlaceholder = NSAttributedString(
            string: "Player \(DCTextField.userCount)",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.bottomAnchor.constraint(equalTo: seperator.topAnchor)
        ])
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private func configureButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "x.circle"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(xButtonPressed), for: .touchUpInside)
        addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            button.leadingAnchor.constraint(equalTo: textField.trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureLabel() {
        label.text = "Player \(id!)"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.tintColor = .white
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .regular)
        addSubview(label)
        
        label.isHidden = true
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: 8),

        ])
    }
    
    @objc func xButtonPressed() {
        if id! > 2 {
            DCTextField.userCount -= 1
            removeFromSuperview()
        } else {
            textField.text = ""
            label.isHidden = true
        }
    }
    
    @objc func textFieldDidChange() {
        if textField.text!.count == 1 {
            label.isHidden = false
            
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut,animations: {
                self.label.frame = CGRectMake(self.label.frame.origin.x, self.label.frame.origin.y - 22, 20, 20)
            })
            
        } else if textField.text == "" {
            label.isHidden = true
        }
    }
}

