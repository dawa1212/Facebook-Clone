import UIKit

class SignUpController: UIViewController {
    
    private let viewModel = SignUpViewModel()
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
        
        viewModel.firstName = screen.firstName.text ?? ""
        viewModel.lastName = screen.lastName.text ?? ""
        viewModel.contact = screen.contact.text ?? ""
        viewModel.password = screen.password.text ?? ""
        viewModel.confirmPassword = screen.confirmPassword.text ?? ""
        
        let error = viewModel.validateSignUpdata()
        if !error.isEmpty {
            showAlert(message: error)
            return
        }
        
        viewModel.signUp {[weak self] result in
            guard let strongself = self else { return }
            switch result {
            case .success:
                strongself.navigationController?.popViewController(animated: true)
            case .failure(let error):
                strongself.showAlert(message: "SignUp failed. \(error.localizedDescription)")
            }
        }
    }
}
