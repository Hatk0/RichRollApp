import UIKit

class CartCollectionViewCell: UICollectionViewCell {
    
    let identifier = CartCollectionViewCell.identifier
    
    var quantity: Int = 1 {
        didSet {
            quantityLabel.text = "\(String(quantity))"
        }
    }
    
    var minusButtonAction: (() -> Void)?
    
    // MARK: - UI
    
    private lazy var image = ReusableImage(contentMode: .scaleAspectFit, clipsToBounds: true)
    
    private lazy var titleLabel = ReusableLabel(font: .boldSystemFont(ofSize: 16))
    
    private lazy var priceLabel = ReusableLabel(font: .systemFont(ofSize: 17, weight: .heavy))
    
    private lazy var minusButton = ReusableButton(backgroundColor: .systemGray5,
                                                  cornerRadius: 15,
                                                  image: UIImage(systemName: "minus"),
                                                  tintColor: .white,
                                                  target: self,
                                                  action: #selector(minusButtonTapped))
    
    private lazy var quantityLabel = ReusableLabel(text: "\(quantity)",
                                                   font: .systemFont(ofSize: 17, weight: .heavy))
    
    private lazy var plusButton = ReusableButton(backgroundColor: .systemGray5,
                                                 cornerRadius: 15,
                                                 image: UIImage(systemName: "plus"),
                                                 tintColor: .white,
                                                 target: self,
                                                 action: #selector(plusButtonTapped))
    
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
        guard quantity < 100 else {
            return
        }
        
        print("Кнопка плюс нажата!")
        quantity += 1
        quantityLabel.text = "\(quantity)"
    }

    // MARK: - Configuration
    
    func configuration(model: Catalog) {
        image.image = UIImage(named: model.image)
        titleLabel.text = model.title
        priceLabel.text = model.price
    }
}
