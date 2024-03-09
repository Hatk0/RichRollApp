import UIKit

class DetailViewController: UIViewController {
    
    var viewModel = DetailViewModel()
    
    // MARK: - UI
    
    private lazy var loveButton = ReusableButton(backgroundColor: .clear,
                                                 image: UIImage(systemName: "star"),
                                                 tintColor: .systemYellow,
                                                 target: self,
                                                 action: #selector(loveButtonTapped))
    
    private lazy var imageView = ReusableImage(contentMode: .scaleAspectFit, clipsToBounds: true)
    
    private lazy var titleLabel = ReusableLabel(font: .boldSystemFont(ofSize: 25),
                                                textColor: .white)
    
    private lazy var priceButton = ReusableButton(backgroundColor: .systemGray5,
                                                  titleFont: .boldSystemFont(ofSize: 18))
    
    private lazy var descriptionLabel = ReusableLabel(font: .systemFont(ofSize: 14),
                                                      textColor: .secondaryLabel)
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        view.backgroundColor = UIColor(red: 0.09, green: 0.09, blue: 0.11, alpha: 1.00)
        
        configuration()
        enableSwipeToDismiss()
    }
    
    private func setupHierarchy() {
        let views = [imageView, loveButton, titleLabel, priceButton, descriptionLabel]
        views.forEach { view.addSubview($0) }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 400),
            
            loveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            loveButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 10),
            loveButton.widthAnchor.constraint(equalToConstant: 100),
            loveButton.heightAnchor.constraint(equalToConstant: 100),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            priceButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            priceButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            priceButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            priceButton.heightAnchor.constraint(equalToConstant: 40),
            
            descriptionLabel.topAnchor.constraint(equalTo: priceButton.bottomAnchor, constant: 15),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    // MARK: - Configuration
    
    func configuration() {
        guard let catalogItem = viewModel.selectedCatalogItem else { return }
            imageView.image = UIImage(named: catalogItem.image)
            titleLabel.text = catalogItem.title
            descriptionLabel.text = catalogItem.description
            priceButton.setTitle(viewModel.priceButtonText, for: .normal)
    }
    
    // MARK: - Action
    
    @objc
    func loveButtonTapped() {
        if let currentImage = loveButton.image(for: .normal),
           currentImage == UIImage(systemName: "star") {
            let filledHeartImage = UIImage(systemName: "star.fill")
            loveButton.setImage(filledHeartImage, for: .normal)
        } else {
            let heartImage = UIImage(systemName: "star")
            loveButton.setImage(heartImage, for: .normal)
        }
    }
}

// MARK: - Extensions

extension DetailViewController {
    
    func enableSwipeToDismiss() {
        let swipeGesture = UIPanGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        self.view.addGestureRecognizer(swipeGesture)
    }
    
    @objc private func handleSwipe(_ gesture: UIPanGestureRecognizer) {
        guard let view = gesture.view else { return }
        
        let translation = gesture.translation(in: view)
        let verticalMovement = translation.y / view.bounds.height
        let progress = max(0, min(1, verticalMovement))
        
        switch gesture.state {
        case .changed:
            view.alpha = 1 - progress
            view.transform = CGAffineTransform(translationX: 0, y: translation.y)
            
        case .ended:
            if progress > 0.5 {
                dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.3) {
                    view.alpha = 1
                    view.transform = .identity
                }
            }
            
        default:
            break
        }
    }
}
