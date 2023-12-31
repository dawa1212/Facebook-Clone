
import Foundation
import UIKit

class HomeController: UIViewController, UICollectionViewDataSource {
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PopularCell.self, forCellWithReuseIdentifier: PopularCell.reuseIdentifier)
        collectionView.register(FirstSimpleStackCell.self, forCellWithReuseIdentifier: "FirstSimpleStackCell")
        collectionView.dataSource = self
        return collectionView
    }()
    
    private let imageNames = ["image1", "image2", "image3", "image4", "image5", "image1", "image2", "image3", "image4", "image5", "image2", "image3", "image4", "image5", "image1", "image2", "image3", "image4", "image5", "image2", "image3", "image4", "image5", "image1", "image2", "image3", "image4", "image5"]
    
    let firstCellId = "FirstSimpleStackCell"
    
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
        
        prepareLayout()
        registerCells()
        
        
    }
    
    func registerCells() {
        collectionView.register(FirstSimpleStackCell.self, forCellWithReuseIdentifier: firstCellId)
    }
    
    private func prepareLayout() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
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
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Return the number of items for each section
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCell.reuseIdentifier, for: indexPath) as! PopularCell
            // Configure the cell with data
            
            let imageName = imageNames[indexPath.item] // Replace with the actual image name or URL
            cell.configure(with: imageName)
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstSimpleStackCell", for: indexPath) as! FirstSimpleStackCell
            // Configure the cell with data
            
            // For demonstration purposes, let's set a placeholder name and image
            let imageName = imageNames[indexPath.item]
            let name = "Dawa Pakhrin"
            cell.configure(with: name, imageName: imageName)
            
            return cell
        }
    }
    
    // MARK: - Compositional Layout
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, _) -> NSCollectionLayoutSection? in
            switch sectionNumber {
            case 0: return self.firstLayoutSection()
            case 1: return self.secondLayoutSection()
            default:
                return self.firstLayoutSection()
            }
        }
    }
    
    private func firstLayoutSection() -> NSCollectionLayoutSection {
        // Implement the layout for the first section
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(0.90))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        // Adjusted content insets for spacing between items
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 16)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Adjusted content insets for spacing between groups
        // group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 20, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.interGroupSpacing = 0
        section.contentInsets =  NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 20, trailing: 0)
        return section
    }
    
    private func secondLayoutSection() -> NSCollectionLayoutSection {
        // Implement the layout for the second section
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.5))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 14, bottom: 0, trailing: 14)
        
        let section = NSCollectionLayoutSection(group: group)
        // section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        section.interGroupSpacing = 80 // Spacing between groups
        
        return section
    }
}
