import UIKit

class MoreViewController: UIViewController {
    
    var viewModel: MoreViewModel = MoreViewModel()
    
    // MARK: - UI
    
    private lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logoImage")
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 40
        image.layer.borderWidth = 0.8
        image.layer.borderColor = UIColor.systemYellow.cgColor
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var dotsButton: UIButton = {
       let button = UIButton()
        button.tintColor = .systemYellow
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.showsMenuAsPrimaryAction = true
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let menuItemButton = UIBarButtonItem()
    
    private lazy var userName: UILabel = {
        let label = UILabel()
        label.text = "Ричард"
        label.font = .systemFont(ofSize: 30, weight: .heavy)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var phoneNumberLabel: UILabel = {
       let label = UILabel()
        label.text = "+8 (800) 555-35-35"
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
       let label = UILabel()
        label.text = "r1chArd2018@gmail.com"
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MoreCollectionViewCell.self, forCellWithReuseIdentifier: MoreCollectionViewCell.identifier)
        collectionView.isScrollEnabled = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
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
        let views = [logoImage, dotsButton, userName, phoneNumberLabel, emailLabel, collectionView]
        views.forEach { view.addSubview($0) }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 80),
            logoImage.heightAnchor.constraint(equalToConstant: 80),
            
            dotsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            dotsButton.leadingAnchor.constraint(equalTo: logoImage.trailingAnchor, constant: 110),
            dotsButton.widthAnchor.constraint(equalToConstant: 30),
            dotsButton.heightAnchor.constraint(equalToConstant: 30),
            
            userName.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 10),
            userName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            phoneNumberLabel.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 5),
            phoneNumberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            emailLabel.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 5),
            emailLabel.leadingAnchor.constraint(equalTo: phoneNumberLabel.trailingAnchor, constant: 15),
            
            collectionView.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
    
    // MARK: - CollectionViewLayout
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (section, _) -> NSCollectionLayoutSection in
            
            switch section {
            case 0:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                                      heightDimension: .fractionalHeight(0.3))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 5, bottom: 0, trailing: 0)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                       heightDimension: .estimated(200))
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,subitems: [layoutItem])

                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.interGroupSpacing = 0

                return layoutSection
            case 1:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .fractionalHeight(0.3))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                       heightDimension: .estimated(200))
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,subitems: [layoutItem])

                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.interGroupSpacing = 0

                return layoutSection
            case 2:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .fractionalHeight(0.3))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                       heightDimension: .estimated(190))
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,subitems: [layoutItem])

                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.interGroupSpacing = 0

                return layoutSection
            default:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))

                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                   leading: 5,
                                                                   bottom: 0,
                                                                   trailing: 5)

                let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                             heightDimension: .estimated(100))
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])

                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.orthogonalScrollingBehavior = .groupPagingCentered

                return layoutSection
            }
        }
    }
    
    // MARK: - Action
    
    @objc
    func buttonTapped() {
        let editProfile = UIAction(title: "Редактировать профиль") { _ in
            print("Редактировать профиль")
        }
        let leave = UIAction(title: "Выйти") { _ in
            print("Выйти")
        }
        let deleteAccount = UIAction(title: "Удалить аккаунт") { _ in
            print("Удалить аккаунт")
        }
        
        let menu = UIMenu(title: "", children: [editProfile, leave, deleteAccount])
        menuItemButton.menu = menu
        dotsButton.menu = menu
    }
}

// MARK: - Extensions

extension MoreViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.items(for: section).count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreCollectionViewCell.identifier, for: indexPath) as? MoreCollectionViewCell else {
            return UICollectionViewCell()
        }

        if let moreItem = viewModel.item(at: indexPath) {
            cell.configuration(model: moreItem)
            cell.backgroundColor = UIColor(red: 0.09, green: 0.09, blue: 0.11, alpha: 1.00)
        }

        return cell
    }
}

extension MoreViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
