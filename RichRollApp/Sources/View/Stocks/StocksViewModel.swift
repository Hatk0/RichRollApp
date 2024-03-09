import Foundation

protocol StocksViewModelProtocol {
    var numberOfStocks: Int { get }
    
    func stock(at index: Int) -> Stocks?
}

final class StocksViewModel: StocksViewModelProtocol {
    private var stocks: [Stocks] = LocalDataService.shared.getModels(fileName: "Stocks")
    
    var numberOfStocks: Int {
        stocks.count
    }
    
    func stock(at index: Int) -> Stocks? {
        guard index >= 0 && index < stocks.count else { return nil }
        return stocks[index]
    }
}
