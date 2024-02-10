import Foundation

struct Stocks: Hashable {
    var image: String
    var title: String
    var description: String
}

extension Stocks {
    static let modelsArray = [
        Stocks(
            image: "dragon",
            title: "Сет дракона",
            description: "ограниченная версия - только в меню доставки!"
        ),
        Stocks(
            image: "discount",
            title: "-20% только для вас",
            description: ""
        ),
        Stocks(
            image: "taste",
            title: "Насладитесь вкусом",
            description: "с Rich"
        ),
        Stocks(
            image: "forel",
            title: "Новое специальное меню",
            description: "«Форель. Погружение»"
        ),
        Stocks(
            image: "onigiri",
            title: "Онигири",
            description: "Новинка в «RichRolls»!"
        ),
        Stocks(
            image: "dragondays",
            title: "Счастливые новогодние дни",
            description: "Повышенная скидка по карте лояльности, подарки и сюрпризы!"
        ),
        Stocks(
            image: "burger",
            title: "Вместе выгоднее",
            description: "При заказе любого бургера из меню - Барэисе Маруяки по цене 103 руб."
        ),
        Stocks(
            image: "loyalty",
            title: "Получайте и удерживайте -20% в ресторанах!",
            description: ""
        ),
        Stocks(
            image: "deliverytips",
            title: "Чаевые курьерам",
            description: "теперь можно поблагодарить курьера в приложении!"
        ),
        Stocks(
            image: "deliverydiscount",
            title: "-20% на доставку",
            description: ""
        )
    ]
}
