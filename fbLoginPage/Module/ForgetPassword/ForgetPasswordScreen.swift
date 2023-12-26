//
//  ForgetPasswordScreen.swift
//  fbLoginPage
//
//  Created by Dawa Pakhrin on 24/12/2023.
//

import UIKit

class ForgetPasswordScreen: UIView {
    
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
        label.text = "Find your account"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let sepeartorLine: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    let subTitle: UILabel = {
        let label = UILabel()
        label.text = """
                     Please enter your email or mobile number to search
                     for your account.
                     """
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy  var forgetPassword = createTextField(placeholder: "Email or mobile number")
    
    let sepeartorLine1: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("Search", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        prepareLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepareLayout() {
        addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 350),
            containerView.heightAnchor.constraint(equalToConstant: 210),
        ])
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(sepeartorLine)
        containerView.addSubview(subTitle)
        containerView.addSubview(forgetPassword)
        containerView.addSubview(sepeartorLine1)
        containerView.addSubview(cancelButton)
        containerView.addSubview(searchButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            
            sepeartorLine.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            sepeartorLine.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            sepeartorLine.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            sepeartorLine.heightAnchor.constraint(equalToConstant: 1),
            
            subTitle.topAnchor.constraint(equalTo: sepeartorLine.bottomAnchor, constant: 10),
            subTitle.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            forgetPassword.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 10),
            forgetPassword.leadingAnchor.constraint(equalTo: subTitle.leadingAnchor),
            forgetPassword.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: -20),
            forgetPassword.heightAnchor.constraint(equalToConstant: 40),
            
            sepeartorLine1.topAnchor.constraint(equalTo: forgetPassword.bottomAnchor, constant: 10),
            sepeartorLine1.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            sepeartorLine1.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            sepeartorLine1.heightAnchor.constraint(equalToConstant: 1),
            
            cancelButton.topAnchor.constraint(equalTo: sepeartorLine1.bottomAnchor, constant: 10),
            cancelButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            cancelButton.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.2),
            cancelButton.heightAnchor.constraint(equalTo: forgetPassword.heightAnchor),

            searchButton.topAnchor.constraint(equalTo: cancelButton.topAnchor),
            searchButton.trailingAnchor.constraint(equalTo: cancelButton.leadingAnchor, constant: -20),
            searchButton.widthAnchor.constraint(equalTo: cancelButton.widthAnchor),
            searchButton.heightAnchor.constraint(equalTo: forgetPassword.heightAnchor),
        ])
        
      
    }
}

