import UIKit

extension CartViewController: UICollectionViewDelegate {
        
    func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.registerCells()
    }
        
    func registerCells() {
        collectionView.register(CartCollectionViewCell.self, forCellWithReuseIdentifier: CartCollectionViewCell.identifier)
    }
}

extension CartViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard section < viewModel.cartItems.count else {
            return 0
        }
        return viewModel.cartItems[section].count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CartCollectionViewCell.identifier, for: indexPath) as? CartCollectionViewCell else {
            return UICollectionViewCell()
        }

        if let catalogItem = viewModel.getCartItem(at: indexPath) {
            cell.configuration(model: catalogItem)

            cell.minusButtonAction = { [weak self, weak cell] in
                guard let indexPath = collectionView.indexPath(for: cell!) else {
                    return
                }
                self?.removeItem(at: indexPath)
            }

            cell.backgroundColor = UIColor(red: 0.09, green: 0.09, blue: 0.11, alpha: 1.00)
        }

        return cell
    }
    
    func removeItem(at indexPath: IndexPath) {
        viewModel.removeFromCart(at: indexPath)
        collectionView.deleteItems(at: [indexPath])
    }
}
