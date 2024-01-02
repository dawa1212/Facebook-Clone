//
//  NotificationCustomcell.swift
//  fbLoginPage
//
//  Created by Dawa Pakhrin on 02/01/2024.
//

import Foundation
import UIKit


class NotificationCustomcell: UICollectionViewCell {
    
    let imageView = UIImageView(image: .image9, contentMode: .scaleAspectFill)
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.numberOfLines = 2
        return label
    }()
    
    
    let descriptionLabel = UILabel(text: "13 minutes ago", font: .systemFont(ofSize: 12), textColor: .systemGray)
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        backgroundColor = .systemGray6
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 8
        
        let attributedText = NSMutableAttributedString(string: "Dawa Pakhrin", attributes: [.font: UIFont.boldSystemFont(ofSize: 16)])
        attributedText.append(NSAttributedString(string: " updated his profile picture", attributes: [.font: UIFont.systemFont(ofSize: 14)]))
        
        nameLabel.attributedText = attributedText
        
        self.contentView.hstack(imageView.withSize(.init(width: 60, height: 60)),
                                self.contentView.stack(nameLabel, descriptionLabel, spacing: 6),
                                spacing: 16,
                                alignment: .center).withMargins(.init(top: 0, left: 12, bottom: 0, right: 12))
        imageView.layer.cornerRadius = 30
        imageView.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    NotificationCustomcell()
}
