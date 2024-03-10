import Foundation

protocol MoreViewModelProtocol {
    func numberOfSections() -> Int
    func sections(for section: Int) -> [More]
    func selectedItem(at indexPath: IndexPath) -> More?
}

final class MoreViewModel: MoreViewModelProtocol {

    private var more: [[More]] = LocalDataService.shared.getModels(fileName: "More")
    
    func numberOfSections() -> Int {
        return more.count
    }
    
    func sections(for section: Int) -> [More] {
        guard section >= 0, section < more.count else { return [] }
        let itemsForSection = more[section]
        return itemsForSection
    }
    
    func selectedItem(at indexPath: IndexPath) -> More? {
        guard indexPath.section >= 0, indexPath.section < more.count else {
            return nil
        }

        guard indexPath.row >= 0, indexPath.row < more[indexPath.section].count else {
            return nil
        }
        
        let selectedItem = more[indexPath.section][indexPath.row]

        return selectedItem
    }
}
