import UIKit

class LoginController: UIViewController{
    
    private let viewModel = LoginViewModel()
    
    lazy var screen = LoginView()
    
    
    override func loadView() {
        super.loadView()
         view =  screen
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
                
        screen.loginButton.addTarget(self, action: #selector(loginButtonTapped(_:)), for: .touchUpInside)
        screen.forgetPassword.addTarget(self, action: #selector(forgetButtonTapped), for: .touchUpInside)
        screen.createButton.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
    }
    
    @objc func loginButtonTapped(_ sender: UIButton) {
        let email = screen.emailTextField.text ?? ""
        let password = screen.passwordTextField.text ?? ""
        if viewModel.validateCredentials() {
            if email == viewModel.email && password == viewModel.password {
                
                let homeVC = HomeController()
                navigationController?.pushViewController(homeVC, animated: true)
            } else {
                showAlert(message: "Incorrect email or password.")
            }
            
        } else {
            showAlert(message: "Incorrect email or password.")
        }
        
    }
    
    @objc func forgetButtonTapped() {
        let forgetPasswordVC = ForgetPasswordController()
        navigationController?.pushViewController(forgetPasswordVC, animated: true)
    }
    
    @objc func createButtonTapped() {
        let signUpVC = SignUpController()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
