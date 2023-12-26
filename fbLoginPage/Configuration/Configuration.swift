//
//  Configuration.swift
//  fbLoginPage
//
//  Created by Dawa Pakhrin on 26/12/2023.
//

import Foundation
import Firebase

class AuthenticationService{
    
    static let shared = AuthenticationService()
    
    private init() {}
    
    func signIn(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
    
    func signUp(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
            
        }
        
    }
    
    func signOut(completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(.success(()))
            
        } catch {
            completion(.failure(error))
            
        }
        
    }
}

