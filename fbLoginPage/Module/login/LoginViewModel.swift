import Foundation

class LoginViewModel {
    var email: String = "Dawa"
    var password: String = "dawa"
    
    func validateCredentials() -> Bool {
        return !email.isEmpty && !password.isEmpty
    }
}
