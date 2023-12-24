import UIKit

class SignUpController: UIViewController {
    
    lazy var screen = SignUpScreen()
    
    
    override func loadView() {
        super.loadView()
        view = screen
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
        setupUI()
    }
    
    private func setupUI() {
        
      
        screen.createButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc func loginButtonTapped() {
        
        guard let firstName = screen.firstName.text, !firstName.isEmpty else {
            showAlert(message: "Please enter your first name.")
            return
        }
        
        guard let lastName = screen.lastName.text, !lastName.isEmpty else {
            showAlert(message: "Please enter your last name.")
            return
        }
        
        guard let contact = screen.contact.text, !contact.isEmpty else {
            showAlert(message: "Please enter your email or mobile number.")
            return
        }
        
        guard let password = screen.password.text, !password.isEmpty else {
            showAlert(message: "Please enter password.")
            return
        }
        
        guard let confirmPassword = screen.confirmPassword.text, !confirmPassword.isEmpty else {
            showAlert(message: "Please enter your password.")
            return
        }
        
        guard password == confirmPassword else {
            showAlert(message: "Password do not match. Please enter the matching password")
            return
        }
        
        let loginController = LoginController()
        navigationController?.setViewControllers([loginController], animated: true)
    }
}
