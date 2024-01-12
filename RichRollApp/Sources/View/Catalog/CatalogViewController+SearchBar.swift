import UIKit

extension CatalogViewController: UISearchBarDelegate {
    
    func setupSearchBar() {
        self.searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchForItem(with: searchText)
    }
    
    func searchForItem(with searchText: String) {
        print("Текст для поиска: \(searchText)")
        
        if searchText.isEmpty {
            filteredItems = catalogItems.flatMap { $0 }
        } else {
            filteredItems = catalogItems.flatMap { $0 }.filter {
                $0.title.localizedCaseInsensitiveContains(searchText)
            }
        }
        print("Количество отфильтрованных элементов: \(filteredItems.count)")
        
        collectionView.reloadData()
    }
}

