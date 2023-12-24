import UIKit

class ForgetPasswordController: UIViewController {
    
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
        label.text = "Find your account"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let sepeartorLine: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    let subTitle: UILabel = {
        let label = UILabel()
        label.text = """
                     Please enter your email or mobile number to search
                     for your account.
                     """
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let forgetPassword: UITextField = {
        let pwd = UITextField()
        pwd.placeholder = "Email or mobile number"
        pwd.borderStyle = .roundedRect
        pwd.translatesAutoresizingMaskIntoConstraints = false
        return pwd
    }()
    
    let sepeartorLine1: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("Search", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
            containerView.widthAnchor.constraint(equalToConstant: 350),
            containerView.heightAnchor.constraint(equalToConstant: 210),
        ])
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(sepeartorLine)
        containerView.addSubview(subTitle)
        containerView.addSubview(forgetPassword)
        containerView.addSubview(sepeartorLine1)
        containerView.addSubview(cancelButton)
        containerView.addSubview(searchButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            
            sepeartorLine.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            sepeartorLine.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            sepeartorLine.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            sepeartorLine.heightAnchor.constraint(equalToConstant: 1),
            
            subTitle.topAnchor.constraint(equalTo: sepeartorLine.bottomAnchor, constant: 10),
            subTitle.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            forgetPassword.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 10),
            forgetPassword.leadingAnchor.constraint(equalTo: subTitle.leadingAnchor),
            forgetPassword.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: -20),
            forgetPassword.heightAnchor.constraint(equalToConstant: 40),
            
            sepeartorLine1.topAnchor.constraint(equalTo: forgetPassword.bottomAnchor, constant: 10),
            sepeartorLine1.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            sepeartorLine1.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            sepeartorLine1.heightAnchor.constraint(equalToConstant: 1),
            
            cancelButton.topAnchor.constraint(equalTo: sepeartorLine1.bottomAnchor, constant: 10),
            cancelButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            cancelButton.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.2),
            cancelButton.heightAnchor.constraint(equalTo: forgetPassword.heightAnchor),

            searchButton.topAnchor.constraint(equalTo: cancelButton.topAnchor),
            searchButton.trailingAnchor.constraint(equalTo: cancelButton.leadingAnchor, constant: -20),
            searchButton.widthAnchor.constraint(equalTo: cancelButton.widthAnchor),
            searchButton.heightAnchor.constraint(equalTo: forgetPassword.heightAnchor),
        ])
        
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }
    
    @objc func cancelButtonTapped() {
        let mainPage = LoginController()
        navigationController?.pushViewController(mainPage, animated: true)
    }
    
    @objc func searchButtonTapped() {
        guard let passwordText = forgetPassword.text, !passwordText.isEmpty else {
            showAlert(message: "Please enter your email or mobile number.")
            return
        }
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
