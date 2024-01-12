import UIKit

extension CatalogViewController: UICollectionViewDataSource {
    
    func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.registerCells()
        filteredItems = catalogItems.flatMap { $0 }
    }
    
    func registerCells() {
        collectionView.register(CatalogCollectionViewCell.self, forCellWithReuseIdentifier: CatalogCollectionViewCell.identifier)
        collectionView.register(RichRollCellHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: RichRollCellHeader.identifier)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionTitles.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionItems = filteredItems(inSection: section)
        return sectionItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatalogCollectionViewCell.identifier, for: indexPath) as? CatalogCollectionViewCell else {
            fatalError("Unable to dequeue CatalogCollectionViewCell")
        }
        
        configureCell(cell, at: indexPath)
        cell.backgroundColor = UIColor(red: 0.09, green: 0.09, blue: 0.11, alpha: 1.00)
        
        return cell
    }
    
    private func configureCell(_ cell: CatalogCollectionViewCell, at indexPath: IndexPath) {
        let sectionItems = filteredItems(inSection: indexPath.section)
        let catalogItem = sectionItems[indexPath.item]
        
        cell.configuration(model: catalogItem)
    }
}

extension CatalogViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: RichRollCellHeader.identifier, for: indexPath) as? RichRollCellHeader {
            let sectionTitleIndex = min(indexPath.section, sectionTitles.count - 1)
            header.titleLabel.text = sectionTitles[sectionTitleIndex]
            return header
        }
        
        return UICollectionReusableView()
    }

    func filteredItems(inSection section: Int) -> [CatalogModel] {
        guard section < catalogItems.count && section < sectionTitles.count else {
            return []
        }

        let searchText = searchBar.text?.lowercased() ?? ""
        
        if searchText.isEmpty {
            return catalogItems[section]
        } else {
            let filteredSectionItems = catalogItems[section].filter {
                $0.title.localizedCaseInsensitiveContains(searchText)
            }
            return filteredSectionItems.isEmpty ? [] : filteredSectionItems
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        let selectedCatalogItem = filteredItems(inSection: indexPath.section)[indexPath.item]
        detailViewController.viewModel.selectedCatalogItem = selectedCatalogItem

        detailViewController.modalPresentationStyle = .fullScreen
        present(detailViewController, animated: true, completion: nil)
    }
}
