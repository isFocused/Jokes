//
//  LoadingView.swift
//  Jokes
//
//  Created by Denis Ivanov on 07.03.2020.
//  Copyright © 2020 Denis Ivanov. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    var blurView: UIVisualEffectView = {
       let view = UIVisualEffectView()
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.effect = UIBlurEffect(style: .prominent)
        return view
    }()
    
    var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "input count..."
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .center
        textField.keyboardType = .decimalPad
        if #available(iOS 13.0, *) {
            textField.textColor = .secondaryLabel
            textField.tintColor = .secondaryLabel
        }
        return textField
    }()
    
    var button: UIButton = {
        let button = UIButton()
        button.setTitle("LOAD", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.clipsToBounds = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 20
        clipsToBounds = true
        setBlurView()
        getTextField()
        getButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        button.clipsToBounds = true
        button.layer.cornerRadius = button.frame.height / 2
    }
    
    private func getTextField() {
        addSubview(textField)
        textField.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 34).isActive = true
    }
    
    private func getButton() {
        addSubview(button)
        button.topAnchor.constraint(greaterThanOrEqualTo: textField.bottomAnchor, constant: 10).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func setBlurView() {
        addSubview(blurView)
        blurView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        blurView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        blurView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        blurView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }
}
