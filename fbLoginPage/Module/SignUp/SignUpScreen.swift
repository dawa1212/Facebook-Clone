//
//  SignUpScreen.swift
//  fbLoginPage
//
//  Created by Dawa Pakhrin on 24/12/2023.
//

import UIKit.UIView

class SignUpScreen: UIView {
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subTitle: UILabel = {
        let label = UILabel()
        label.text = "It’s quick and easy."
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let sepeartorLine: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    private(set) lazy  var firstName = createTextField(placeholder: "First name")
    
    private(set) lazy  var lastName = createTextField(placeholder: "Last name")
    
    private(set) lazy  var contact = createTextField(placeholder: "Mobile number or email")
        
    private(set) lazy  var password = createTextField(placeholder: "New password", isSecure: true)
    
    private(set) lazy  var  confirmPassword = createTextField(placeholder: "Confirm password", isSecure: true)
   
    
    let createButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = """
                        By clicking Sign Up, you agree to our Terms,Privacy Policy and Cookies Policy.
                     """
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 10
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .fill
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        prepareLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepareLayout() {
        
        addSubview(containerView)
        containerView.addSubview(stackView)
        [firstName, lastName, contact, password, confirmPassword].forEach(stackView.addArrangedSubview(_:))
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 300),
            containerView.heightAnchor.constraint(equalToConstant: 430),
        ])
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(subTitle)
        containerView.addSubview(sepeartorLine)
        
        containerView.addSubview(createButton)
        containerView.addSubview(infoLabel)
        
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            
            subTitle.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subTitle.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            sepeartorLine.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 10),
            sepeartorLine.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            sepeartorLine.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            sepeartorLine.heightAnchor.constraint(equalToConstant: 1),
            
            stackView.topAnchor.constraint(equalTo: sepeartorLine.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            stackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            infoLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            infoLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            infoLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: -10),
            infoLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 10),
            infoLabel.bottomAnchor.constraint(lessThanOrEqualTo:createButton.topAnchor, constant: -10),
            
            createButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            createButton.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 10),
            createButton.widthAnchor.constraint(equalToConstant: 150),
            createButton.heightAnchor.constraint(equalToConstant: 40),
        ])
        
    }
}


#Preview {
    SignUpScreen()
}
