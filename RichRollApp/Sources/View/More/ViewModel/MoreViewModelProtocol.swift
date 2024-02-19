import Foundation

protocol MoreViewModelProtocol {
    func numberOfSections() -> Int
    func items(for section: Int) -> [More]
    func item(at indexPath: IndexPath) -> More?
}
