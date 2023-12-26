//
//  SignUpViewModel.swift
//  fbLoginPage
//
//  Created by Dawa Pakhrin on 24/12/2023.
//

import Foundation

class SignUpViewModel {
    var firstName: String = ""
    var lastName: String = ""
    var contact: String = ""
    var password: String = ""
    var confirmPassword: String = ""
    
    func validateSignUpdata() -> String {
        if firstName.isEmpty {
            return "Please enter your name"
        } else if lastName.isEmpty {
            return "Please enter your last name"
        }else if contact.isEmpty {
            return "Please enter your contact"
        }else if password.isEmpty {
            return "Please enter a  password"
        }else if confirmPassword.isEmpty {
            return "Please enter your password again"
        }
        return ""
    }
    
    func signUp(completion: @escaping (Result<Void, Error>) -> Void) {
        AuthenticationService.shared.signUp(email: contact, password: password) { result in
            switch result {
                
            case .success:
                completion(.success(()))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
