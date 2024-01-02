import UIKit

class NotificationController: UIViewController {
    
    let notificatioViewModel = NotificationViewModel()
    let screen = NotificationScreen()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupCollectionView()
        registerCells()
    }
    
    private func setupNavigationBar() {
        navigationItem.titleView = UIView()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: screen.titleMenu)
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"),
                            style: .plain,
                            target: self, action: #selector(didTapMagnifyButton))]
    }
    
    @objc func didTapMagnifyButton() {
        // Handle magnifying glass button tap
    }
    private func setupCollectionView() {
        view.addSubview(screen)
        screen.collectionView.delegate = self
        screen.collectionView.dataSource = self
        
        // Add constraints for the profileView (using Auto Layout)
        screen.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: view.topAnchor),
            screen.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func registerCells() {
        screen.collectionView.register(NotificationCustomcell.self, forCellWithReuseIdentifier: screen.firstCellId)
        screen.collectionView.register(NotificationCustomcell2.self, forCellWithReuseIdentifier: screen.secondCellId)
        // Register section header view
        screen.collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionHeader")
    }
    
}



extension NotificationController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else {
            return 3
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellId: String
        if indexPath.section == 0 {
            cellId = screen.firstCellId
            //        } else if indexPath.section == 1 {
            //            cellId = screen.secondCellId
            //            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ProfileCollectionCell2
            //            let icon = viewModel.icons[indexPath.item]
            //            let title = viewModel.containerTitles[indexPath.item]
            //            cell.configure(with: icon, title: title)
            //            return cell
        } else {
            cellId = screen.secondCellId
        }
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 15, left: 0, bottom: 15, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return .init(width: view.frame.width, height: 80)
        } else if indexPath.section == 1 {
            return .init(width: view.frame.width, height: 80)
        } else {
            return .init(width: view.frame.width - 32, height: 40)
        }
    }
    
    // Implement section header view
        func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            if kind == UICollectionView.elementKindSectionHeader {
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath)
                headerView.backgroundColor = .white // Set background color as needed
                let titleLabel = UILabel()
                titleLabel.text = indexPath.section == 0 ? "New" : "Earlier"
                titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
                titleLabel.textColor = .black
                headerView.addSubview(titleLabel)
                titleLabel.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
                    titleLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
                    titleLabel.topAnchor.constraint(equalTo: headerView.topAnchor),
                    titleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
                ])
                return headerView
            }
            return UICollectionReusableView()
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 20)
    }
    
    
}

#Preview {
    NotificationController()
}
