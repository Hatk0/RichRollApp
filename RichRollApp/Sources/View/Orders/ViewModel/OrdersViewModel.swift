import Foundation

final class OrdersViewModel: OrdersViewModelProtocol {
    func getOrdersLabelText() -> String {
        return "У вас нет заказов \n Давайте исправим?"
    }
}
