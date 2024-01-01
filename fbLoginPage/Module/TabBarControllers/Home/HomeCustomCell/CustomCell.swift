
import UIKit

class FirstLayoutCollectionCustomCell: UICollectionViewCell {
    
    static let reuseIdentifier = "PopularCell"
    
    private let contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        addSubview(contentImageView)
        
        NSLayoutConstraint.activate([
            contentImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentImageView.topAnchor.constraint(equalTo: topAnchor),
            contentImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func configure(with imageName: String) {
        // Load image and set it to contentImageView
        contentImageView.image = UIImage(named: imageName)
    }
}

