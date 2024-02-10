import UIKit

class StocksCollectionViewCell: UICollectionViewCell {
    
    let identifier = StocksCollectionViewCell.identifier
    
    // MARK: - UI
    
    private lazy var image = ReusableImage(contentMode: .scaleAspectFill, clipsToBounds: true)
    
    private lazy var titleLabel = ReusableLabel(text: "",
                                                font: .boldSystemFont(ofSize: 20),
                                                textColor: nil,
                                                numberOfLines: 0,
                                                textAlignment: nil)
        
    private lazy var descriptionLabel = ReusableLabel(text: "",
                                                      font: .systemFont(ofSize: 12, weight: .regular),
                                                      textColor: nil,
                                                      numberOfLines: 0,
                                                      textAlignment: nil)
        
    // MARK: - Initalizers
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupHierarchy()
        setupLayout()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    // MARK: - Setup
    
    private func setupView() {
        backgroundColor = UIColor(red: 0.09, green: 0.09, blue: 0.11, alpha: 1.00)
    }
        
    private func setupHierarchy() {
        let views = [image, titleLabel, descriptionLabel]
        views.forEach { self.addSubview($0) }
    }
        
    private func setupLayout() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            image.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7),
                
            titleLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -8)
        ])
    }
    
    // MARK: - Configuration

    func configuration(model: Stocks) {
        image.image = UIImage(named: model.image)
        titleLabel.text = model.title
        descriptionLabel.text = model.description
    }
}
