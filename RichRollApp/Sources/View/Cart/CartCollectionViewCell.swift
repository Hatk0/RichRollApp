import UIKit

class CartCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CartCollectionViewCell"
    
    var quantity: Int = 1 {
        didSet {
            quantityLabel.text = "\(quantity)"
        }
    }
    
    var minusButtonAction: (() -> Void)?
    
    // MARK: - UI
    
    lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var minusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "\(quantity)"
        label.font = .systemFont(ofSize: 17, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        let views = [image, titleLabel, priceLabel, minusButton, quantityLabel, plusButton]
        views.forEach { self.contentView.addSubview($0) }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            image.widthAnchor.constraint(equalToConstant: 80),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            priceLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            
            plusButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 20),
            plusButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            plusButton.widthAnchor.constraint(equalToConstant: 30),
            plusButton.heightAnchor.constraint(equalToConstant: 30),
            
            quantityLabel.centerYAnchor.constraint(equalTo: plusButton.centerYAnchor, constant: -1),
            quantityLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -6),
            quantityLabel.leadingAnchor.constraint(greaterThanOrEqualTo: priceLabel.trailingAnchor, constant: 10),
            
            minusButton.centerYAnchor.constraint(equalTo: plusButton.centerYAnchor),
            minusButton.trailingAnchor.constraint(equalTo: quantityLabel.leadingAnchor, constant: -5),
            minusButton.widthAnchor.constraint(equalToConstant: 30),
            minusButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    // MARK: - Actions
    
    @objc private func minusButtonTapped() {
        minusButtonAction?()
    }

    @objc
    func plusButtonTapped() {
        print("Кнопка плюс нажата!")
        if quantity < 100 {
            quantity += 1
            quantityLabel.text = "\(quantity)"
        }
    }
    
    // MARK: - Configuration
    
    func configuration(model: CatalogModel) {
        self.image.image = UIImage(named: model.image)
        self.titleLabel.text = model.title
        self.priceLabel.text = model.price
    }
    
    // MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
    }
}
