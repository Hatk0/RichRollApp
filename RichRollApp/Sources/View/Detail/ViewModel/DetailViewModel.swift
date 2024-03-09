import Foundation

protocol DetailViewModelProtocol {
    var image: String { get }
    var title: String { get }
    var description: String { get }
    var priceButtonText: String { get }
    var isLiked: Bool { get }
    
    func toggleLike()
}

final class DetailViewModel: DetailViewModelProtocol {
    var selectedCatalogItem: Catalog?
    
    var image: String {
        return selectedCatalogItem?.image ?? ""
    }
    
    var title: String {
        return selectedCatalogItem?.title ?? ""
    }
    
    var description: String {
        return selectedCatalogItem?.description ?? ""
    }
    
    var priceButtonText: String {
        return "\(selectedCatalogItem?.price ?? "") Добавить"
    }
    
    var isLiked: Bool = false
    
    func toggleLike() {
        isLiked.toggle()
    }
}
