import UIKit
import FirebaseAuth

class LoginController: UIViewController{
    
    private let viewModel = LoginViewModel()
    
    lazy var screen = LoginScreen()
    
    
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
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    @objc func loginButtonTapped(_ sender: UIButton) {
        viewModel.email = screen.emailTextField.text ?? ""
        viewModel.password = screen.passwordTextField.text ?? ""

        let error = viewModel.validateCredentials()
        if !error.isEmpty {
            showAlert(message: error)
            return
        }

        viewModel.authenticate { [weak self] result in
            guard let strongSelf = self else { return }
            
            switch result {
            case .success:
                let tabBarController = TabBarController()
                strongSelf.navigationController?.pushViewController(tabBarController, animated: true)
            case .failure(let error):
                strongSelf.showAlert(message: "Login failed. \(error.localizedDescription)")
            }
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
    
   
    
}
