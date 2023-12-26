import UIKit

class AnimalDetailViewController: UIViewController {

    var selectedImage: UIImage?

    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        // Add the image view to the view controller's view
        view.addSubview(imageView)

        // Set up constraints for the image view to fit the entire view
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        // Set the selected image to the image view
        imageView.image = selectedImage

        // Add a tap gesture recognizer to dismiss the view controller when tapped
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func handleTap() {
        // Dismiss the view controller when tapped
        dismiss(animated: true, completion: nil)
    }
}
