import Foundation

struct StocksModel: Hashable {
    var image: String
    var title: String
    var description: String
}

extension StocksModel {
    static let modelsArray = [
        StocksModel(image: "dragon", title: "Сет дракона", description: "ограниченная версия - только в меню доставки!"),
        StocksModel(image: "discount", title: "-20% только для вас", description: ""),
        StocksModel(image: "taste", title: "Насладитесь вкусом", description: "с Rich"),
        StocksModel(image: "forel", title: "Новое специальное меню", description: "«Форель. Погружение»"),
        StocksModel(image: "onigiri", title: "Онигири", description: "Новинка в «RichRolls»!"),
        StocksModel(image: "dragondays", title: "Счастливые новогодние дни", description: "Повышенная скидка по карте лояльности, подарки и сюрпризы!"),
        StocksModel(image: "burger", title: "Вместе выгоднее", description: "При заказе любого бургера из меню - Барэисе Маруяки по цене 103 руб."),
        StocksModel(image: "loyalty", title: "Получайте и удерживайте -20% в ресторанах!", description: ""),
        StocksModel(image: "deliverytips", title: "Чаевые курьерам", description: "теперь можно поблагодарить курьера в приложении!"),
        StocksModel(image: "deliverydiscount", title: "-20% на доставку", description: "")
    ]
}
