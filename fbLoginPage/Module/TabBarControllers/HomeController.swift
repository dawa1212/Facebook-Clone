
import Foundation
import UIKit

class HomeController: UIViewController {
    
    private lazy var scroll: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let label = UILabel()
        label.text = "facebook"
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = .systemBlue
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: label)
        
        let logout = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"),
                                     style: .plain,
                                     target: self,
                                     action: #selector(didTapSignOut))
        
        navigationItem.rightBarButtonItems = [ logout,
                                               UIBarButtonItem(image: UIImage(systemName: "ellipsis.message"),
                                                               style: .plain,
                                                               target: self, action: #selector(didTapMessageButton)),
                                               UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"),
                                                               style: .plain,
                                                               target: self, action: #selector(didTapMagnifyButton))]
        
        prepareLayout()
        
        
    }
    private func prepareLayout() {
        
        
        view.addSubview(scroll)
        
        let customView = UIView()
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.backgroundColor = .systemBlue
        customView.accessibilityIdentifier = "customView"
        
        let custom2 = UIView()
        custom2.translatesAutoresizingMaskIntoConstraints = false
        custom2.backgroundColor = .yellow
        custom2.accessibilityIdentifier = "custom2"
        
        scroll.addSubview(customView)
        customView.addSubview(custom2)
        
        NSLayoutConstraint.activate([
            scroll.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            scroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            scroll.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            scroll.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            
            customView.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 0),
            customView.topAnchor.constraint(equalTo: scroll.topAnchor, constant: 0),
            customView.trailingAnchor.constraint(equalTo: scroll.trailingAnchor, constant: 0),
            customView.bottomAnchor.constraint(equalTo: scroll.bottomAnchor, constant: 0),
            customView.heightAnchor.constraint(equalToConstant: 1000),
            scroll.widthAnchor.constraint(equalTo: customView.widthAnchor),
            
            custom2.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 0),
            custom2.topAnchor.constraint(equalTo: customView.topAnchor, constant: 0),
            custom2.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: 0),
            custom2.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    @objc private func addTapped() {
        
    }
    
    @objc private func didTapSignOut() {
        showAlertLogout(
            message: "Do you want to logout?",
            confirmTitle: "Logout",
            cancelTitle: "Cancel"
        ) { [weak self] in
            guard let strongSelf = self else { return }
            
            AuthenticationService.shared.signOut { result in
                switch result {
                case .success:
                    let loginVc = LoginController()
                    
                    strongSelf.navigationController?.tabBarController?.navigationController?.setViewControllers([loginVc], animated: true)
                case .failure(let error):
                    strongSelf.showAlert(message: "Logout failed. \(error.localizedDescription)")
                }
            }
        }
    }
    
    @objc private func didTapMessageButton() {
        
    }
    
    @objc private func didTapMagnifyButton() {
        
    }
}
