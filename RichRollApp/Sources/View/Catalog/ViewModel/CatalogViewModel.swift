import Foundation

final class CatalogViewModel: CatalogViewModelProtocol {
    let numberOfSectionsObservable = Observable<Int>(0)
    let itemsObservable = Observable<[Catalog]>([])
    let selectedItemObservable = Observable<Catalog?>(nil)
    
    private var catalog: [[Catalog]] = LocalData.shared.getModels(fileName: "Catalog")
    private var filteredItems: [Catalog] = []
    
    let sectionTitles = ["Форель. Погружение", "Онигири", "Роллы", "Горячие роллы", "Сеты", "Напитки", "Соусы"]
    
    func reloadData() {
        searchForItem(with: "")
    }
    
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
    
    func searchForItem(with searchText: String) {
        print("Текст для поиска: \(searchText)")
        
        if searchText.isEmpty {
            filteredItems = catalog.flatMap { $0 }
        } else {
            filteredItems = catalog.flatMap { $0 }.filter {
                $0.title.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        print("Количество отфильтрованных элементов: \(filteredItems.count)")
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
        let sectionItems = filteredItems(inSection: indexPath.section)
        guard indexPath.item < sectionItems.count else {
            return
        }

        let catalogItem = sectionItems[indexPath.item]
        cell.configuration(model: catalogItem)
    }
}
