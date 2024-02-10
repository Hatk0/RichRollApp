import Foundation

final class CatalogViewModel {
    let numberOfSectionsObservable = Observable<Int>(0)
    let itemsObservable = Observable<[Catalog]>([])
    let selectedItemObservable = Observable<Catalog?>(nil)
    
    private var catalog: [[Catalog]] = Catalog.catalogArray
    
    func numberOfSections() -> Int {
        let numberOfSections = catalog.count
        numberOfSectionsObservable.value = numberOfSections
        return numberOfSections
    }
    
    func items(for section: Int) -> [Catalog] {
        guard section >= 0, section < catalog.count else { return [] }
        let itemsForSection = catalog[section]
        itemsObservable.value = itemsForSection
        return itemsForSection
    }
    
    func item(at indexPath: IndexPath) -> Catalog? {
        guard indexPath.section >= 0, indexPath.section < catalog.count else {
            selectedItemObservable.value = nil
            return nil
        }
        
        guard indexPath.row >= 0, indexPath.row < catalog[indexPath.section].count else {
            selectedItemObservable.value = nil
            return nil
        }
        
        let selectedItem = catalog[indexPath.section][indexPath.row]
        selectedItemObservable.value = selectedItem
        return selectedItem
    }
}
