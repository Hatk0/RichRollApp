import UIKit

class RichRollCellHeader: UICollectionReusableView {
    
    static let identifier = "RichRollCellHeader"
    
    // MARK: - UI
    
    lazy var titleLabel: UILabel = {
        return makeLabel(withText: "",
                         font: .boldSystemFont(ofSize: 15),
                         textColor: .darkGray,
                         numberOfLines: 0,
                         textAlignment: nil)
    }()
    
    // MARK: - Initalizers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        addSubview(titleLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
    
    // MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
    }
}
