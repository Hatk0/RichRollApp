import Foundation

final class CartViewModel {
    
    var cartItems: [[Catalog]] = Catalog.catalogArray
    
    var isCartEmpty: Bool {
        return cartItems.isEmpty
    }
    
    var totalItemsCount: Int {
        return cartItems.flatMap { $0 }.count
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
    
    func addToCart(item: Catalog) {
        cartItems.append([item])
    }
    
    func removeFromCart(at indexPath: IndexPath) {
        guard indexPath.section < cartItems.count, indexPath.item < cartItems[indexPath.section].count else {
            return
        }
        cartItems[indexPath.section].remove(at: indexPath.item)
        
        if cartItems[indexPath.section].isEmpty {
            cartItems.remove(at: indexPath.section)
        }
    }
    
    func getCartItem(at indexPath: IndexPath) -> Catalog? {
        guard indexPath.section < cartItems.count, indexPath.item < cartItems[indexPath.section].count else {
            return nil
        }
        return cartItems[indexPath.section][indexPath.item]
    }
    
    func clearCart() {
        cartItems = []
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
    
    private func calculateTotalPriceNumeric() -> Int {
        let totalPrice = cartItems.flatMap { $0 }.reduce(0) { $0 + (Int($1.price) ?? 0) }
        return totalPrice
    }
}
