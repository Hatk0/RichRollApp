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
