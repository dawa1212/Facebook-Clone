import UIKit

class HomeController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let homeView = HomeScreen()
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let label = UILabel()
        label.text = "facebook"
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = .systemBlue
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: label)
        
        navigationItem.rightBarButtonItems = [ UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"),
                                                               style: .plain,
                                                               target: self,
                                                               action: #selector(didTapSignOut)),
                                               UIBarButtonItem(image: UIImage(systemName: "ellipsis.message"),
                                                               style: .plain,
                                                               target: self, action: #selector(didTapMessageButton)),
                                               UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"),
                                                               style: .plain,
                                                               target: self, action: #selector(didTapMagnifyButton))]
        setupUI()
        registerCells()
    }
    
    func registerCells() {
        homeView.collectionView.register(FirstlayoutCollectionCustomCell.self, forCellWithReuseIdentifier: FirstlayoutCollectionCustomCell.reuseIdentifier)
        homeView.collectionView.register(SecondlayoutCollectionCustomCell.self, forCellWithReuseIdentifier: SecondlayoutCollectionCustomCell.reuseIdentifier)
    }
    
    private func setupUI() {
        view.addSubview(homeView)
        homeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            homeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeView.topAnchor.constraint(equalTo: view.topAnchor),
            homeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        homeView.collectionView.delegate = self
        homeView.collectionView.dataSource = self
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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstlayoutCollectionCustomCell.reuseIdentifier, for: indexPath) as! FirstlayoutCollectionCustomCell
            let imageName = viewModel.imageNames[indexPath.item]
            cell.configure(with: imageName)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondlayoutCollectionCustomCell.reuseIdentifier, for: indexPath) as! SecondlayoutCollectionCustomCell
            let imageName = viewModel.imageNames[indexPath.item]
            let name = "Dawa Pakhrin"
            cell.configure(with: name, imageName: imageName)
            return cell
        }
    }
}
