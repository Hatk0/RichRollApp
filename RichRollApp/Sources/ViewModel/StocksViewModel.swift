import Foundation

final class StocksViewModel {
    private var stocks: [Stocks] = Stocks.modelsArray
    
    var numberOfStocks: Int {
        return stocks.count
    }
    
    func stock(at index: Int) -> Stocks? {
        guard index >= 0, index < stocks.count else { return nil }
        return stocks[index]
    }
}
