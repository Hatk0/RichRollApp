import UIKit

class DetailViewController: UIViewController {
    
    var viewModel = DetailViewModel()
    
    // MARK: - UI
    
    private lazy var loveButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "star"), for: .normal)
        button.tintColor = .systemYellow
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(loveButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var priceButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray5
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
