import Foundation

final class StocksViewModel {
    private var stocks: [StocksModel] = StocksModel.modelsArray
    
    var numberOfStocks: Int {
        return stocks.count
    }
    
    func stock(at index: Int) -> StocksModel? {
        guard index >= 0, index < stocks.count else { return nil }
        return stocks[index]
    }
}
