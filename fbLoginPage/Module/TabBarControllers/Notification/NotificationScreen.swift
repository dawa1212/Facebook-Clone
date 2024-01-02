//
//  NotificationViewModel.swift
//  AnyTest
//
//  Created by Dawa Pakhrin on 02/01/2024.
//

import Foundation
import UIKit

class NotificationScreen: UIView {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    let titleMenu: UILabel = {
        let title = UILabel()
        title.text = "Notification"
        title.font = .boldSystemFont(ofSize: 32)
        return title
    }()
    
    let firstCellId = "ProfileCollectionCell"
    let secondCellId = "ProfileCollectionCell2"
    
    
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
            layout.minimumLineSpacing = 0
        }
    }
}
