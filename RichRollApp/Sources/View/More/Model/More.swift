import Foundation

struct More: Hashable {
    var image: String
    var title: String
}

extension More {
    static let moreArray = [
        
        // Адреса и карты
        [
            More(
            image: "point",
            title: "Адреса"
        ),
         More(
            image: "cards",
            title: "Карты"
         )
        ],
        
        // Мои промокоды
        [
            More(
            image: "promocode",
            title: "Мои промокоды"
            )
        ],
        
        // Избранное, настройки, условия доставки, рестораны, связаться с нами, о приложении
        [
            More(
                image: "favourites",
                title: "Избранное"
            ),
            More(
                image: "settings",
                title: "Настройки"
            ),
            More(
                image: "car",
                title: "Условия доставки"
            ),
            More(
                image: "restaurants",
                title: "Рестораны"
            ),
            More(
                image: "message",
                title: "Связаться с нами"
            ),
            More(
                image: "info",
                title: "О приложении"
            )
        ]
    ]
}
