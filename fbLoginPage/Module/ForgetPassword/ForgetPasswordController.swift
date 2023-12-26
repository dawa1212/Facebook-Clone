import UIKit

class ForgetPasswordController: UIViewController {
    
    lazy var screen = ForgetPasswordScreen()
    
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
        screen.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        screen.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }
    
    @objc func cancelButtonTapped() {
        let loginViewController = LoginController()
        navigationController?.setViewControllers([loginViewController], animated: true)
    }
    
    @objc func searchButtonTapped() {
        guard let passwordText = screen.forgetPassword.text, !passwordText.isEmpty else {
            showAlert(message: "Please enter your email or mobile number.")
            return
        }
    }

}
