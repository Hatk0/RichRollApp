import Foundation

protocol StocksViewModelProtocol {
    var numberOfStocks: Int { get }
    
    func stockItem(atIndex index: Int) -> Stocks?
}

final class StocksViewModel: StocksViewModelProtocol {
    private var stocks: [Stocks] = LocalDataService.shared.getModels(fileName: "Stocks")
    
    var numberOfStocks: Int {
        stocks.count
    }
    
    func stockItem(atIndex index: Int) -> Stocks? {
        guard index >= 0 && index < stocks.count else { return nil }
        return stocks[index]
    }
}
