import UIKit

protocol LoginViewDelegate: AnyObject {
    func loginButtonTapped(email: String, password: String)
    func forgetButtonTapped()
    func createButtonTapped()
}

class LoginView: UIView {
    
    weak var delegate: LoginViewDelegate?

    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 10
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .fill
        return view
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "facebook"
        label.textAlignment = .center
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email or phone number"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let forgetPassword: UIButton = {
        let button = UIButton()
        button.setTitle("Forget password?", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let separatorLine: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    let createButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create new account", for: .normal)
        button.backgroundColor = .systemGreen
        return button
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Create a Page for a celebrity, brand or business."
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init(delegate: LoginViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        addSubview(containerView)
        containerView.addSubview(stackView)
        [titleLabel, emailTextField, passwordTextField, loginButton, forgetPassword, separatorLine, createButton].forEach(stackView.addArrangedSubview(_:))
        addSubview(infoLabel)

        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 300),
            containerView.heightAnchor.constraint(equalToConstant: 300),
            
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            stackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),

            infoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            infoLabel.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 20),

            separatorLine.heightAnchor.constraint(equalToConstant: 1)
        ])

//        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
//        forgetPassword.addTarget(self, action: #selector(forgetButtonTapped), for: .touchUpInside)
//        createButton.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
    }

//    @objc private func loginButtonTapped() {
//        guard let email = emailTextField.text, !email.isEmpty else {
//            // Show error message
//            return
//        }
//
//        guard let password = passwordTextField.text, !password.isEmpty else {
//            // Show error message
//            return
//        }
//
//        delegate?.loginButtonTapped(email: email, password: password)
//    }
//
//    @objc private func forgetButtonTapped() {
//        delegate?.forgetButtonTapped()
//    }
//
//    @objc private func createButtonTapped() {
//        delegate?.createButtonTapped()
//    }
}
