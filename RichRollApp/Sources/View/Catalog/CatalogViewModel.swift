import Foundation

protocol CatalogViewModelProtocol {
    var itemsObservable: Observable<[Catalog]> { get }
    var selectedItemObservable: Observable<Catalog?> { get }
    
    func reloadData()
    func searchForItem(with searchText: String)
    func filteredItems(inSection section: Int) -> [Catalog]
    func configureCell(_ cell: CatalogCollectionViewCell, at indexPath: IndexPath)
    func didTap(on index: Int)
}

final class CatalogViewModel: CatalogViewModelProtocol {
    let itemsObservable = Observable<[Catalog]>([])
    let selectedItemObservable = Observable<Catalog?>(nil)
    
    private var catalog: [[Catalog]] = LocalDataService.shared.getModels(fileName: "Catalog")
    private var filteredItems: [Catalog] = []
    let sections: [CatalogSection] = CatalogSection.allSections
    
    func reloadData() {
        searchForItem(with: "")
    }
    
    func searchForItem(with searchText: String) {
        if searchText.isEmpty {
            filteredItems = catalog.flatMap { $0 }
        } else {
            filteredItems = catalog.flatMap { $0.filter { $0.title.localizedCaseInsensitiveContains(searchText) } }
        }
        
        itemsObservable.value = filteredItems
    }
    
    func filteredItems(inSection section: Int) -> [Catalog] {
        guard section < catalog.count else {
            return []
        }

        let sectionItems = catalog[section]
        let filteredSectionItems = sectionItems.filter { item in
            return filteredItems.contains { filteredItem in
                return item == filteredItem
            }
        }
        return filteredSectionItems
    }

    func configureCell(_ cell: CatalogCollectionViewCell, at indexPath: IndexPath) {
        guard indexPath.section < catalog.count else {
            return
        }

        let sectionItems = filteredItems(inSection: indexPath.section)
        guard indexPath.item < sectionItems.count else {
            return
        }

        let catalogItem = sectionItems[indexPath.item]
        cell.configuration(model: catalogItem)
    }
    
    func didTap(on index: Int) {
        guard index >= 0, index < filteredItems.count else {
            selectedItemObservable.value = nil
            return
        }
        
        let selectedItem = filteredItems[index]
        selectedItemObservable.value = selectedItem
    }
}
