import Foundation

protocol CartViewModelProtocol {
    var isCartEmpty: Bool { get }
    var totalItemsCount: Int { get }
    var deliveryCost: String { get }
    var serviceCharge: String { get }
    
    func numberOfItems(inSection section: Int) -> Int
    func addToCart(item: Catalog)
    func removeFromCart(at indexPath: IndexPath)
    func getCartItem(at indexPath: IndexPath) -> Catalog?
    func clearCart()
    func calculateTotalPrice() -> String
    func getItemDetails(at indexPath: IndexPath) -> (title: String, price: String)?
    func calculateTotalPriceNumeric() -> Int
}

final class CartViewModel {
    private var cart: [[Catalog]] = LocalDataService.shared.getModels(fileName: "Catalog")

    var totalPriceText: String {
        return "Сумма заказа: \(calculateTotalPrice())"
    }

    var deliveryText: String {
        return "Доставка: \(deliveryCost)"
    }

    var serviceChargeText: String {
        return "Сервисный сбор: \(serviceCharge)"
    }

    var totalText: String {
        return "Итого: \(calculateTotalPrice())"
    }
    
    var isCartEmpty: Bool {
        return cart.isEmpty
    }

    var totalItemsCount: Int {
        return cart.flatMap { $0 }.count
    }

    var deliveryCost: String {
        let fixedDeliveryCost = 75
        
        return "\(fixedDeliveryCost) руб."
    }

    var serviceCharge: String {
        let serviceChargePercentage = 20
        let totalPrice = calculateTotalPriceNumeric()
        let serviceCharge = (totalPrice * serviceChargePercentage) / 100
        
        return "\(serviceCharge) руб."
    }

    func numberOfItems(inSection section: Int) -> Int {
        section < cart.count ? cart[section].count : .zero
    }

    func addToCart(item: Catalog) {
        cart.append([item])
    }

    func removeFromCart(at indexPath: IndexPath) {
        guard indexPath.section < cart.count, indexPath.item < cart[indexPath.section].count else {
            return
        }
        cart[indexPath.section].remove(at: indexPath.item)

        if cart[indexPath.section].isEmpty {
            cart.remove(at: indexPath.section)
        }
    }

    func getCartItem(at indexPath: IndexPath) -> Catalog? {
        guard indexPath.section < cart.count, indexPath.item < cart[indexPath.section].count else {
            return nil
        }
        
        return cart[indexPath.section][indexPath.item]
    }

    func clearCart() {
        cart = []
    }

    func calculateTotalPrice() -> String {
        return "\(calculateTotalPriceNumeric()) руб."
    }

    func getItemDetails(at indexPath: IndexPath) -> (title: String, price: String)? {
        guard let cartItem = getCartItem(at: indexPath) else {
            return nil
        }
        
        let title = cartItem.title
        let price = cartItem.price
        
        return (title, price)
    }

    func calculateTotalPriceNumeric() -> Int {
        let totalPrice = cart.flatMap { $0 }.reduce(0) { $0 + (Int($1.price) ?? 0) }
        
        return totalPrice
    }
}
