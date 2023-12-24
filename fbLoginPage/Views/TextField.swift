//
//  TextField.swift
//  fbLoginPage
//
//  Created by Dawa Pakhrin on 24/12/2023.
//

import UIKit

class TextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        borderStyle = .roundedRect
        translatesAutoresizingMaskIntoConstraints = false

    }
}

func createTextField(placeholder: String, isSecure: Bool = false) -> TextField {
    let textfield = TextField()
    textfield.placeholder = placeholder
    textfield.isSecureTextEntry = isSecure
    return textfield
}
