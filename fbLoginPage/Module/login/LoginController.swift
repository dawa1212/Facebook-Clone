import UIKit
import FirebaseAuth

class LoginController: UIViewController{
    
    private let viewModel = LoginViewModel()
    
    lazy var screen = LoginScreen()
    
    private var isLoggingIn = false
    
    
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
        
        guard !isLoggingIn else {
            return
        }
        
//        viewModel.email = screen.emailTextField.text ?? ""
//        viewModel.password = screen.passwordTextField.text ?? ""
//
//        let error = viewModel.validateCredentials()
//        if !error.isEmpty {
//            showAlert(message: error)
//            return
//        }
        
        isLoggingIn = true

//        viewModel.authenticate { [weak self] result in
//            guard let strongSelf = self else { return }
//            
//            switch result {
//            case .success:
        navigationController?.setNavigationBarHidden(true, animated: false)
                let tabBarController = TabBarController()
        navigationController?.pushViewController(tabBarController, animated: true)
//                strongSelf.navigationController?.pushViewController(tabBarController, animated: true)
//            case .failure(let error):
//                strongSelf.showAlert(message: "Login failed. \(error.localizedDescription)")
//            }
            
//            strongSelf.isLoggingIn = false
        isLoggingIn = false
//        }
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
