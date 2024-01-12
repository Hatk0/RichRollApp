import Foundation

final class MoreViewModel {
    let numberOfSectionsObservable = Observable<Int>(0)
    let itemsObservable = Observable<[MoreModel]>([])
    let selectedItemObservable = Observable<MoreModel?>(nil)
    
    private var more: [[MoreModel]] = MoreModel.moreArray
    
    func numberOfSections() -> Int {
        let numberOfSections = more.count
        numberOfSectionsObservable.value = numberOfSections
        return numberOfSections
    }
    
    func items(for section: Int) -> [MoreModel] {
        guard section >= 0, section < more.count else { return [] }
        let itemsForSection = more[section]
        itemsObservable.value = itemsForSection
        return itemsForSection
    }
    
    func item(at indexPath: IndexPath) -> MoreModel? {
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
