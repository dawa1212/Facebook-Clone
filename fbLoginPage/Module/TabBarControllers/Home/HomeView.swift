import UIKit

class FirstSimpleStackCell: UICollectionViewCell {
    
    let circularImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.backgroundColor = .systemGray5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .systemGray
        label.textAlignment = .justified
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let likeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Like", for: .normal)
        button.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
        button.setTitleColor(.systemBrown, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        return button
    }()
    
    let commentButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Comment", for: .normal)
        button.setImage(UIImage(systemName: "text.bubble"), for: .normal)
        button.setTitleColor(.systemBrown, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        return button
    }()
    
    let messageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Message", for: .normal)
        button.setImage(UIImage(systemName: "ellipsis.message"), for: .normal)
        button.setTitleColor(.systemBrown, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        return button
    }()
    
    let shareButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Share", for: .normal)
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.setTitleColor(.systemBrown, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(circularImageView)
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(messageButton)
        addSubview(shareButton)
        
        
        NSLayoutConstraint.activate([
            circularImageView.topAnchor.constraint(equalTo: topAnchor, constant: 3),
            circularImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            circularImageView.widthAnchor.constraint(equalToConstant: 40),
            circularImageView.heightAnchor.constraint(equalToConstant: 40),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: circularImageView.trailingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            imageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5), // Half the width
            
            // Buttons
            likeButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            likeButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            commentButton.topAnchor.constraint(equalTo: likeButton.topAnchor),
            commentButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 40),
            
            messageButton.topAnchor.constraint(equalTo: likeButton.topAnchor),
            messageButton.leadingAnchor.constraint(equalTo: commentButton.trailingAnchor, constant: 40),
            
            shareButton.topAnchor.constraint(equalTo: likeButton.topAnchor),
            shareButton.leadingAnchor.constraint(equalTo: messageButton.trailingAnchor, constant: 40)
        ])
        
    }
    
    func configure(with name: String, imageName: String) {
        nameLabel.text = name
        circularImageView.image = UIImage(named: imageName) // Set your placeholder image
        imageView.image = UIImage(named: imageName) // Replace with your actual image
        descriptionLabel.text = "\(name) has updated his profile"
    }
    
        
}

