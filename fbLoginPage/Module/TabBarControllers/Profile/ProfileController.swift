//
//  profileController.swift
//  AnyTest
//
//  Created by Dawa Pakhrin on 01/01/2024.
//



import UIKit

class ProfileController: UIViewController {
    
    let profileView = ProfileView()
    let viewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupCollectionView()
        registerCells()
    }
    
    private func setupNavigationBar() {
        navigationItem.titleView = UIView()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileView.titleMenu)
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"),
                            style: .plain,
                            target: self, action: #selector(didTapMagnifyButton)),
            
            UIBarButtonItem(image: UIImage(systemName: "gearshape.fill"),
                            style: .plain,
                            target: self, action: #selector(didTapMessageButton)),
        ]
    }
    
    private func setupCollectionView() {
        view.addSubview(profileView)
        profileView.collectionView.delegate = self
        profileView.collectionView.dataSource = self
        
        // Add constraints for the profileView (using Auto Layout)
        profileView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: view.topAnchor),
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func registerCells() {
        profileView.collectionView.register(ProfileCollectionCell.self, forCellWithReuseIdentifier: profileView.firstCellId)
        profileView.collectionView.register(ProfileCollectionCell2.self, forCellWithReuseIdentifier: profileView.secondCellId)
        profileView.collectionView.register(ProfileCollectionCell3.self, forCellWithReuseIdentifier: profileView.thirdCellId)
    }
    
    @objc func didTapMessageButton() {
        // Handle message button tap
    }
    
    @objc func didTapMagnifyButton() {
        // Handle magnifying glass button tap
    }
}

extension ProfileController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return viewModel.icons.count
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellId: String
        if indexPath.section == 0 {
            cellId = profileView.firstCellId
        } else if indexPath.section == 1 {
            cellId = profileView.secondCellId
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ProfileCollectionCell2
            let icon = viewModel.icons[indexPath.item]
            let title = viewModel.containerTitles[indexPath.item]
            cell.configure(with: icon, title: title)
            return cell
        } else {
            cellId = profileView.thirdCellId
        }
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 20, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return .init(width: view.frame.width - 32, height: 80)
        } else if indexPath.section == 1 {
            return .init(width: 189, height: 80)
        } else {
            return .init(width: view.frame.width - 32, height: 40)
        }
    }
}
