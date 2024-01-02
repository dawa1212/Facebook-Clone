//
//  ProfileCollectionCell3.swift
//  AnyTest
//
//  Created by Dawa Pakhrin on 01/01/2024.
//

import Foundation
import UIKit

class ProfileCollectionCell3: UICollectionViewCell {
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "See more"
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray5.cgColor
        backgroundColor = .systemGray5
        
        layer.cornerRadius = 8
        
        self.contentView.stack(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    TabBarController()
}
