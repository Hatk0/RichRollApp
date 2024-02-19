import Foundation

final class MoreViewModel: MoreViewModelProtocol {
    let numberOfSectionsObservable = Observable<Int>(0)
    let itemsObservable = Observable<[More]>([])
    let selectedItemObservable = Observable<More?>(nil)

    private var more: [[More]] = LocalData.shared.getModels(fileName: "More")
    
    func numberOfSections() -> Int {
        let numberOfSections = more.count
        numberOfSectionsObservable.value = numberOfSections
        return numberOfSections
    }
    
    func items(for section: Int) -> [More] {
        guard section >= 0, section < more.count else { return [] }
        let itemsForSection = more[section]
        itemsObservable.value = itemsForSection
        return itemsForSection
    }
    
    func item(at indexPath: IndexPath) -> More? {
        guard indexPath.section >= 0, indexPath.section < more.count else {
            selectedItemObservable.value = nil
            return nil
        }
        
        guard indexPath.row >= 0, indexPath.row < more[indexPath.section].count else {
            selectedItemObservable.value = nil
            return nil
        }
        
        let selectedItem = more[indexPath.section][indexPath.row]
        selectedItemObservable.value = selectedItem
        return selectedItem
    }
}
