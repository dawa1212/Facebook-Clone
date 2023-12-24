import UIKit

class SignUpController: UIViewController {
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subTitle: UILabel = {
        let label = UILabel()
        label.text = "It’s quick and easy."
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let sepeartorLine: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    let firstName: UITextField = {
        let name = UITextField()
        name.placeholder = "First name"
        name.borderStyle = .roundedRect
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    let lastName: UITextField = {
        let name = UITextField()
        name.placeholder = "Last name"
        name.borderStyle = .roundedRect
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    let contact: UITextField = {
        let name = UITextField()
        name.placeholder = "Mobile number or email"
        name.borderStyle = .roundedRect
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    let password: UITextField = {
        let pwd = UITextField()
        pwd.placeholder = "New password"
        pwd.borderStyle = .roundedRect
        pwd.translatesAutoresizingMaskIntoConstraints = false
        return pwd
    }()
    
    let confirmPassword: UITextField = {
        let pwd = UITextField()
        pwd.placeholder = "Confirm password"
        pwd.borderStyle = .roundedRect
        pwd.translatesAutoresizingMaskIntoConstraints = false
        return pwd
    }()
    
    let createButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = """
                        By clicking Sign Up, you agree to our Terms,Privacy Policy and Cookies Policy.
                     """
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
        setupUI()
    }
    
    private func setupUI() {
        
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 300),
            containerView.heightAnchor.constraint(equalToConstant: 380),
        ])
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(subTitle)
        containerView.addSubview(sepeartorLine)
        containerView.addSubview(firstName)
        containerView.addSubview(lastName)
        containerView.addSubview(contact)
        containerView.addSubview(password)
        containerView.addSubview(confirmPassword)
        containerView.addSubview(createButton)
        containerView.addSubview(infoLabel)
        
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            
            subTitle.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subTitle.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            sepeartorLine.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 10),
            sepeartorLine.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            sepeartorLine.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            sepeartorLine.heightAnchor.constraint(equalToConstant: 1),
            
            firstName.topAnchor.constraint(equalTo: sepeartorLine.bottomAnchor, constant: 10),
            firstName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            firstName.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.4),
            firstName.heightAnchor.constraint(equalToConstant: 40),
            
            lastName.topAnchor.constraint(equalTo: firstName.topAnchor),
            lastName.leadingAnchor.constraint(equalTo: firstName.trailingAnchor, constant: 10),
            lastName.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            lastName.heightAnchor.constraint(equalTo: firstName.heightAnchor),
            
            contact.topAnchor.constraint(equalTo: firstName.bottomAnchor, constant: 10),
            contact.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            contact.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            contact.heightAnchor.constraint(equalTo: firstName.heightAnchor),
            
            password.topAnchor.constraint(equalTo: contact.bottomAnchor, constant: 10),
            password.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            password.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            password.heightAnchor.constraint(equalTo: firstName.heightAnchor),
            
            confirmPassword.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 10),
            confirmPassword.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            confirmPassword.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            confirmPassword.heightAnchor.constraint(equalTo: firstName.heightAnchor),
            
            infoLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            infoLabel.topAnchor.constraint(equalTo: confirmPassword.bottomAnchor, constant: 10),
            infoLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: -10),
            infoLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 10),
            infoLabel.bottomAnchor.constraint(lessThanOrEqualTo:createButton.topAnchor, constant: -10),
            
            createButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            createButton.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 10),
            createButton.widthAnchor.constraint(equalToConstant: 150),
            createButton.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        createButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc func loginButtonTapped() {
        
        guard let firstName = firstName.text, !firstName.isEmpty else {
            showAlert(message: "Please enter your first name.")
            return
        }
        
        guard let lastName = lastName.text, !lastName.isEmpty else {
            showAlert(message: "Please enter your last name.")
            return
        }
        
        guard let contact = contact.text, !contact.isEmpty else {
            showAlert(message: "Please enter your email or mobile number.")
            return
        }
        
        guard let password = password.text, !password.isEmpty else {
            showAlert(message: "Please enter password.")
            return
        }
        
        guard let confirmPassword = confirmPassword.text, !confirmPassword.isEmpty else {
            showAlert(message: "Please enter your password.")
            return
        }
        
        guard password == confirmPassword else {
            showAlert(message: "Password do not match. Please enter the matching password")
            return
        }
        
            let mainPage = LoginController()
            navigationController?.pushViewController(mainPage, animated: true)
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
