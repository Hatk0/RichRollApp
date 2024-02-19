import Foundation

final class StocksViewModel: StocksViewModelProtocol {
    private var stocks: [Stocks] = LocalData.shared.getModels(fileName: "Stocks")
    
    var numberOfStocks: Int {
        stocks.count
    }
    
    func stock(at index: Int) -> Stocks? {
        guard index >= 0 && index < stocks.count else { return nil }
        return stocks[index]
    }
}
