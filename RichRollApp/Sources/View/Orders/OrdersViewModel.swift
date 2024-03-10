import Foundation

protocol OrdersViewModelProtocol {
    func getOrdersLabelText() -> String
}

final class OrdersViewModel: OrdersViewModelProtocol {
    func getOrdersLabelText() -> String {
        return "У вас нет заказов \n Давайте исправим?"
    }
}
