import Foundation

protocol CatalogViewModelProtocol {
    var numberOfSectionsObservable: Observable<Int> { get }
    var itemsObservable: Observable<[Catalog]> { get }
    var selectedItemObservable: Observable<Catalog?> { get }
    var sectionTitles: [String] { get }
    
    func reloadData()
    func numberOfSections() -> Int
    func items(for section: Int) -> [Catalog]
    func item(at indexPath: IndexPath) -> Catalog?
    func searchForItem(with searchText: String)
    func filteredItems(inSection section: Int) -> [Catalog]
    func configureCell(_ cell: CatalogCollectionViewCell, at indexPath: IndexPath)
}
