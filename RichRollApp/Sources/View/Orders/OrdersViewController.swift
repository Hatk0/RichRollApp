import UIKit

class OrdersViewController: UIViewController {
    
    var viewModel = OrdersViewModel()
    
    // MARK: - UI
    
    private lazy var ordersLabel: UILabel = {
        return makeLabel(withText: "\(viewModel.getOrdersLabelText())",
                         font: .boldSystemFont(ofSize: 20),
                         textColor: nil,
                         numberOfLines: 2,
                         textAlignment: .center)
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
        overrideUserInterfaceStyle = .dark  
    }
    
    private func setupHierarchy() {
        view.addSubview(ordersLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            ordersLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ordersLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
