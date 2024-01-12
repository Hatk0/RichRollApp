import UIKit

class OrdersViewController: UIViewController {
    
    var viewModel = OrdersViewModel()
    
    // MARK: - UI
    
    private lazy var ordersLabel: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.text = viewModel.getOrdersLabelText()
        label.numberOfLines = 2
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
