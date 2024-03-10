import Foundation

struct CatalogSection {
    let title: String
}

extension CatalogSection {
    static let allSEctions: [CatalogSection] = [
        CatalogSection(title: "Форель. Погружение"),
        CatalogSection(title: "Онигири"),
        CatalogSection(title: "Роллы"),
        CatalogSection(title: "Горячие роллы"),
        CatalogSection(title: "Сеты"),
        CatalogSection(title: "Напитки"),
        CatalogSection(title: "Соусы")
    ]
}
