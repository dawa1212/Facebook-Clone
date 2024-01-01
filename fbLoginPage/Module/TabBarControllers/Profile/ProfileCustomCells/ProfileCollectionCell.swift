//
//  ProfileCollectionCell.swift
//  fbLoginPage
//
//  Created by Dawa Pakhrin on 01/01/2024.
//

import Foundation
import UIKit

class ProfileCollectionCell: UICollectionViewCell {
    
    let imageView = UIImageView(image: .image9, contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Dawa Pakhrin", font: .boldSystemFont(ofSize: 20))
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        backgroundColor = .white
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 8
        
        self.contentView.hstack(imageView.withSize(.init(width: 60, height: 60)),
                                self.contentView.stack(nameLabel),
                                spacing: 16,
                                alignment: .center).withMargins(.allSides(12))
        imageView.layer.cornerRadius = 30
        imageView.layer.masksToBounds = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    ProfileController()
}

