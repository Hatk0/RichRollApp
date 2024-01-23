import UIKit

extension MoreViewController {
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        registerCells()
    }

    func registerCells() {
        collectionView.register(MoreCollectionViewCell.self, forCellWithReuseIdentifier: MoreCollectionViewCell.identifier)
    }
}

// MARK: - UICollectionViewDataSource

extension MoreViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.items(for: section).count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreCollectionViewCell.identifier, for: indexPath) as? MoreCollectionViewCell else {
            return UICollectionViewCell()
        }

        if let moreItem = viewModel.item(at: indexPath) {
            cell.configuration(model: moreItem)
            cell.backgroundColor = UIColor(red: 0.09, green: 0.09, blue: 0.11, alpha: 1.00)
        }

        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension MoreViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
