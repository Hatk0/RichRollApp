import Foundation

struct Catalog: Codable {
    var image: String
    var title: String
    var description: String
    var price: String
    
    static func == (lhs: Catalog, rhs: Catalog) -> Bool {
        return lhs.title == rhs.title && lhs.description == rhs.description
    }
}
