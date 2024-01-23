import UIKit

class CatalogCollectionViewCell: UICollectionViewCell {
    
    let identifier = CatalogCollectionViewCell.identifier
    
    // MARK: - UI
    
    lazy var image: UIImageView = {
        return makeImageView(contentMode: .scaleAspectFit, clipsToBounds: true)
    }()
    
    lazy var titleLabel: UILabel = {
        return makeLabel(withText: "",
                         font: .boldSystemFont(ofSize: 15),
                         textColor: nil,
                         numberOfLines: 0,
                         textAlignment: nil)
    }()
    
    lazy var descriptionLabel: UILabel = {
        return makeLabel(withText: "",
                         font: .systemFont(ofSize: 12, weight: .regular),
                         textColor: nil,
                         numberOfLines: 2,
                         textAlignment: nil)
    }()
    
    lazy var priceButton: UIButton = {
        return makeButton(backgroundColor: .systemGray5,
                          titleFont: .boldSystemFont(ofSize: 12),
                          cornerRadius: 10,
                          image: nil,
                          tintColor: nil,
                          title: "",
                          target: nil,
                          action: nil,
                          for: .touchUpInside)
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
        let views = [image, titleLabel, descriptionLabel, priceButton]
        views.forEach { self.addSubview($0) }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            image.heightAnchor.constraint(equalToConstant: 150),
            
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),

            priceButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            priceButton.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            priceButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            priceButton.widthAnchor.constraint(equalToConstant: 50),
            priceButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    // MARK: - Configuration
    
    func configuration(model: CatalogModel) {
        image.image = UIImage(named: model.image)
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        priceButton.setTitle("\(model.price)", for: .normal)
    }
}
