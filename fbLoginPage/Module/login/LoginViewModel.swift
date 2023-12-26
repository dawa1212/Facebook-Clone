import Foundation

class LoginViewModel {
    var email: String = ""
    var password: String = ""
    
    func validateCredentials() -> String {
        if email.isEmpty {
            return "Please enter a email address"
        } else if password.isEmpty {
            return "Please enter a  password"
        }
        return ""
    }
    
    //    func checkLogin() -> Bool {
    //         email == "Dawa" && password == "dawa"
    //    }
    //
    
    func authenticate(completion: @escaping (Result<Void, Error>) -> Void) {
        AuthenticationService.shared.signIn(email: email, password: password) { result in
            switch result {
            case .success:
                completion(.success(()))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
    
}
