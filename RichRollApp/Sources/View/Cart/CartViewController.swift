import UIKit

class CartViewController: UIViewController {
    
    var viewModel = CartViewModel()
    
    // MARK: - UI
    
    lazy var clearButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitle("Очистить корзину", for: .normal)
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        button.tintColor = .systemGray3
        button.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    lazy var orderButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitle("Оформить заказ", for: .normal)
        button.tintColor = .black
        button.backgroundColor = .systemYellow
        button.addTarget(self, action: #selector(orderButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var sumLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.text = "Сумма заказа: \(viewModel.calculateTotalPrice())"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var deliveryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.text = "Доставка: \(viewModel.deliveryCost)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var serviceChargeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.text = "Сервисный сбор: \(viewModel.serviceCharge)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.text = "Итого: \(viewModel.calculateTotalPrice())"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var emptyView: EmptyView = {
        let emptyView = EmptyView()
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        emptyView.isHidden = !CatalogModel.catalogArray.isEmpty
        return emptyView
    }()

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
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
        
        setupCollectionView()
        calculateAndSetContentSize()
    }
    
    private func setupHierarchy() {
        let views = [clearButton, collectionView, sumLabel, deliveryLabel, serviceChargeLabel, totalLabel, orderButton]
        views.forEach { scrollView.addSubview($0) }
        view.addSubview(scrollView)
        view.addSubview(emptyView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            clearButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            clearButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            clearButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            clearButton.heightAnchor.constraint(equalToConstant: 50),

            collectionView.topAnchor.constraint(equalTo: clearButton.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            collectionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 1000),
            collectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -20),

            sumLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            sumLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            sumLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),

            deliveryLabel.topAnchor.constraint(equalTo: sumLabel.bottomAnchor, constant: 10),
            deliveryLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            deliveryLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),

            serviceChargeLabel.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor, constant: 10),
            serviceChargeLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            serviceChargeLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),

            totalLabel.topAnchor.constraint(equalTo: serviceChargeLabel.bottomAnchor, constant: 10),
            totalLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            totalLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),

            orderButton.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 10),
            orderButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            orderButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            orderButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10),
            orderButton.heightAnchor.constraint(equalToConstant: 50),
            
            emptyView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func calculateAndSetContentSize() {
        let contentHeight = clearButton.frame.height + collectionView.frame.height + sumLabel.frame.height + deliveryLabel.frame.height + serviceChargeLabel.frame.height + totalLabel.frame.height + orderButton.frame.height + 80
        scrollView.contentSize = CGSize(width: view.frame.width, height: contentHeight)
    }

    // MARK: - CollectionViewLayout
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5))
            let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
            layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(200))
            let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [layoutItem])
            
            let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
            layoutSection.interGroupSpacing = 0
            
            return layoutSection
        }
    }
    
    // MARK: - Action

    @objc
    func clearButtonTapped() {
        print("Корзина очистилась!")

        viewModel.clearCart()
        collectionView.reloadData()

        let isCartEmpty = viewModel.isCartEmpty

        clearButton.isHidden = isCartEmpty
        emptyView.isHidden = !isCartEmpty
        sumLabel.isHidden = isCartEmpty
        deliveryLabel.isHidden = isCartEmpty
        serviceChargeLabel.isHidden = isCartEmpty
        totalLabel.isHidden = isCartEmpty
        orderButton.isHidden = isCartEmpty

        if isCartEmpty {
            calculateAndSetContentSize()
            scrollView.isScrollEnabled = false
        } else {
            scrollView.isScrollEnabled = true
        }
    }


    @objc
    func orderButtonTapped() {
        print("Кнопка заказа нажата!")
    }
}
