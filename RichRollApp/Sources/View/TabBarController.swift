import UIKit

class TabBarController: UITabBarController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
        setupTabBarViewControllers()
    }
    
    // MARK: - Tab setup
    
    func setupTabBarController() {
        overrideUserInterfaceStyle = .dark
        tabBar.tintColor = .systemYellow
        
        tabBar.isTranslucent = false
    }
    
    private func setupTabBarViewControllers() {
        let catalog = self.createNavigation(with: "Каталог",
                                            and: UIImage(named: "rolls"),
                                            viewController: CatalogViewController())
        let stocks = self.createNavigation(with: "Акции",
                                           and: UIImage(named: "percent"),
                                           viewController: StocksViewController())
        let orders = self.createNavigation(with: "Заказы",
                                           and: UIImage(named: "waiter"),
                                           viewController: OrdersViewController())
        let cart = self.createNavigation(with: "Корзина",
                                         and: UIImage(named: "foodcart"),
                                         viewController: CartViewController())
        let more = self.createNavigation(with: "Еще",
                                         and: UIImage(systemName: "ellipsis"),
                                         viewController: MoreViewController())
        
        let controllers = [catalog, stocks, orders, cart, more]
        self.setViewControllers(controllers, animated: true)
    }
    
    private func createNavigation(with title: String,
                                  and image: UIImage?,
                                  viewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        
        navigationController.navigationBar.isTranslucent = false
        
        navigationController.navigationBar.prefersLargeTitles = true
        
        if title == "Еще" || title == "Каталог" {
            viewController.navigationItem.title = ""
            navigationController.viewControllers.first?.navigationItem.title = ""
            navigationController.navigationBar.isHidden = true
        } else {
            navigationController.viewControllers.first?.navigationItem.title = title
        }
        
        return navigationController
    }
}
