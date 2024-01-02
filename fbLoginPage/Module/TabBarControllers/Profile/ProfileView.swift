//
//  ProfileView.swift
//  fbLoginPage
//
//  Created by Dawa Pakhrin on 02/01/2024.
//

import LBTATools
import UIKit

class ProfileView: UIView {
    
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
    
    let firstCellId = "ProfileCollectionCell"
    let secondCellId = "ProfileCollectionCell2"
    let thirdCellId = "ProfileCollectionCell3"
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(collectionView)
        collectionView.fillSuperview()
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 10
        }
    }
}
