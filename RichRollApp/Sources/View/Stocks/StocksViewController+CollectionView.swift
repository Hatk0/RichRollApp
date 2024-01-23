import UIKit

extension StocksViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        registerCells()
    }
    
    func registerCells() {
        collectionView.register(StocksCollectionViewCell.self, forCellWithReuseIdentifier: StocksCollectionViewCell.identifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return viewModel.numberOfStocks
     }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StocksCollectionViewCell.identifier, for: indexPath) as? StocksCollectionViewCell else { return UICollectionViewCell() }
        
        if let stock = viewModel.stock(at: indexPath.item) {
            cell.configuration(model: stock)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width - 20,
                      height: collectionView.frame.size.height / 3)
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}
