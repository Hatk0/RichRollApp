import Foundation

protocol StocksViewModelProtocol {
    var numberOfStocks: Int { get }
    
    func stock(at index: Int) -> Stocks?
}
