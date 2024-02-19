import Foundation

protocol DetailViewModelProtocol {
    var image: String { get }
    var title: String { get }
    var description: String { get }
    var priceButtonText: String { get }
    var isLiked: Bool { get }
    
    func toggleLike()
}
