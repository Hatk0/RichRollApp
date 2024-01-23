import Foundation

struct MoreModel: Hashable {
    var image: String
    var title: String
}

extension MoreModel {
    static let moreArray = [
        
        // Адреса и карты
        [
            MoreModel(
            image: "point",
            title: "Адреса"
        ),
         MoreModel(
            image: "cards",
            title: "Карты"
         )
        ],
        
        // Мои промокоды
        [
            MoreModel(
            image: "promocode",
            title: "Мои промокоды"
            )
        ],
        
        // Избранное, настройки, условия доставки, рестораны, связаться с нами, о приложении
        [
            MoreModel(
                image: "favourites",
                title: "Избранное"
            ),
            MoreModel(
                image: "settings",
                title: "Настройки"
            ),
            MoreModel(
                image: "car",
                title: "Условия доставки"
            ),
            MoreModel(
                image: "restaurants",
                title: "Рестораны"
            ),
            MoreModel(
                image: "message",
                title: "Связаться с нами"
            ),
            MoreModel(
                image: "info",
                title: "О приложении"
            )
        ]
    ]
}
