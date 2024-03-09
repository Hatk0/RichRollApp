import UIKit

class EmptyView: UIView {
    
    // MARK: - UI
    
    private lazy var messageLabel = ReusableLabel(text: "В корзине пока нет еды.\nСовсем. Нет. Еды",
                                                  font: .boldSystemFont(ofSize: 20),
                                                  textColor: .white,
                                                  numberOfLines: 0,
                                                  textAlignment: .center)
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        overrideUserInterfaceStyle = .dark
        
        setupHierarchy()
        setupLayout()
    }
    
    private func setupHierarchy() {
        addSubview(messageLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    func setMessage(_ message: String) {
        messageLabel.text = message
    }
}
