//import UIKit
//
//class AccountCheckingController: UIViewController {
//    
//    var selectedAnimal: String?
//    var animalImage: UIImage?
//    
//    let nameLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.boldSystemFont(ofSize: 18)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    let animalImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFit
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        setupUI()
//    }
//    
//    private func setupUI() {
//        view.addSubview(nameLabel)
//        view.addSubview(animalImageView)
//        
//        NSLayoutConstraint.activate([
//            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            
//            animalImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            animalImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
//            animalImageView.widthAnchor.constraint(equalToConstant: 150),
//            animalImageView.heightAnchor.constraint(equalToConstant: 150),
//        ])
//        
//        if let animalName = selectedAnimal, let animalImage = animalImage {
//            nameLabel.text = "Animal: \(animalName)"
//            animalImageView.image = animalImage
//        }
//    }
//}
