//
//  profileController.swift
//  AnyTest
//
//  Created by Dawa Pakhrin on 01/01/2024.
//

import LBTATools
import UIKit

class ProfileController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemGray6
        return collectionView
    }()
    
    let titleMenu: UILabel = {
        let title = UILabel()
        title.text = "Menu"
        title.font = .boldSystemFont(ofSize: 32)
        return title
    }()
    
    let firstCellId = "FirstSimpleStackCell"
    let secondCellId = "SecondSimpleStackCell"
    let thirdCellId = "ThirdSimpleStackCell"
    
    let icons: [UIImage] = [
        UIImage(systemName: "bookmark")!,
        UIImage(systemName: "person.2.square.stack")!,
        UIImage(systemName: "book")!,
        UIImage(systemName: "clock")!,
        UIImage(systemName: "film")!,
        UIImage(systemName: "bag")!,
        UIImage(systemName: "person.3")!,
        UIImage(systemName: "newspaper")!
    ]
    
    let containerTitles = [
        "Saved",
        "Groups",
        "Pages",
        "Memories",
        "Video",
        "Marketplace",
        "Find Friends",
        "Feeds"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the titleView to be an empty UIView to avoid conflicts with leftBarButtonItem
        navigationItem.titleView = UIView()
        
        // Set the titleMenu as the left bar button item
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleMenu)
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"),
                            style: .plain,
                            target: self, action: #selector(didTapMagnifyButton)),
            
            UIBarButtonItem(image: UIImage(systemName: "gearshape.fill"),
                            style: .plain,
                            target: self, action: #selector(didTapMessageButton)),
        ]
        
        
        setupCollectionView()
        registerCells()
    }
    
    @objc func didTapMessageButton() {
        
    }
    
    @objc func didTapMagnifyButton() {
        
        
    }
    
    func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.fillSuperview()
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 10
        }
    }
    
    func registerCells() {
        collectionView.register(ProfileCollectionCell.self, forCellWithReuseIdentifier: firstCellId)
        collectionView.register(ProfileCollectionCell2.self, forCellWithReuseIdentifier: secondCellId)
        collectionView.register(ProfileCollectionCell3.self, forCellWithReuseIdentifier: thirdCellId)
        
    }
    
    // MARK: - UICollectionViewDataSource methods
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 8
        } else {
            return 1
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellId: String
        if indexPath.section == 0 {
            cellId = firstCellId
        } else if indexPath.section == 1 {
            cellId = secondCellId
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ProfileCollectionCell2
            let icon = icons[indexPath.item] // Assuming icons is an array of UIImage
            let title = containerTitles[indexPath.item] // Assuming containerTitles is an array of String
            cell.configure(with: icon, title: title)
            return cell
        } else {
            cellId = thirdCellId
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
    
    
    // MARK: - UICollectionViewDelegateFlowLayout methods
    
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


extension UIViewController {
    
    func pop<V: UIViewController>(type: V.Type) {
        if let navigationController {
            if let controller = navigationController.viewControllers.filter( { $0 is V }).first {
                navigationController.popToViewController(controller, animated: true)
            }
        }
    }
}

#Preview {
    ProfileController()
}
