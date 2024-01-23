import Foundation

struct CatalogModel: Hashable {
    var image: String
    var title: String
    var description: String
    var price: String
}

extension CatalogModel {
    static var catalogArray = [
        
        // Форель. Погружение
        [
            CatalogModel(
                image: "orlandorory",
                title: "Орландо рору",
                description: "Ролл с тартаром из слабосоленной форели и тунца; сливочный сыр, авокадо, огурец, лимонный конфи в бордовом масаго, с икрой палтуса и соусом васаби юдзу",
                price: "598 ₽"
            ),
            CatalogModel(
                image: "shiodzuki",
                title: "Шиодзуки",
                description: "форель слабосоленная, рис, васаби, кресс-салат, цедра лимона",
                price: "119 ₽"
            ),
            CatalogModel(
                image: "shiodzukicalifornia",
                title: "Шиодзуки Калифорния",
                description: "Мясо краба, гуакамоле из авокадо, суси рис, в слайсах слабосоленной форели, икра палтуса (7 шт.)",
                price: "677 ₽"
            ),
            CatalogModel(
                image: "shiodzukitamagoroll",
                title: "Шиодзуки тамаго ролл",
                description: "обжаренный в темпуре ролл: копченный угорь, слабосоленная форель, сливочный сыр, авакадо, в маменори и тамаго. Сервируется с цитрусовым соусом «Спайси»",
                price: "597 ₽"
            ),
            CatalogModel(
                image: "bostonrory",
                title: "Бостон рору",
                description: "спайси угорь, авакадо, огурец, васаби, нори, рис, тартар из слабосоленной форели с майонезом и юдзу, трюфельное масло, кунжут, кресс-салат (7 шт.)",
                price: "597 ₽"
            ),
            CatalogModel(
                image: "nagoyarory",
                title: "Нагоя рору",
                description: "Теплый темпура-ролл: слабосоленая форель, спайси угорь, снежный краб, масаго, авокадо, под соусом из голубого сыра, с луком фри и тобико (6 шт.)",
                price: "609 ₽"),
            CatalogModel(
                image: "fykyamasushi",
                title: "Фукуяма суши",
                description: "слабосоленая форель, гуакамоле из авокадо, суси рис, спайси соус, на обжаренных нори «васаби» (3 шт.)",
                price: "357 ₽"
            ),
             CatalogModel(
                image: "сaesarshiodzuki",
                title: "Салат «Цезарь шиодзуки»",
                description: "слабосоленая форель, салат романо, шеф-соус «Цезарь»», подпеченные крутоны из белого хлеба, пармезан",
                price: "597 ₽"
             ),
             CatalogModel(
                image: "cheesesoup",
                title: "Сырный суп с брускеттой шиодзуки",
                description: "сливочно-сырный суп с добавлением голубого сыра, приправленный острым маслом и черным перцем; брускетта с рийетом из форели горячего копчения со сливочным сыром и укропом",
                price: "457 ₽"
             ),
             CatalogModel(
                image: "bruschettawithforel",
                title: "Брускетты с форелью горячего копчения",
                description: "хрустящие тосты из пшеничного багета, риет из форели горячего копчения и слабосоленой форели, зерновая горчица, сливочный сыр, лук-шалот, каперсы, икра палтуса (3 шт.)",
                price: "557 ₽"
             )
        ],
        
        // Онигири
        [
            CatalogModel(
                image: "onigiricalifornia",
                title: "Онигири Калифорния",
                description: "мясо краба, суси рис, авокадо, сливочный сыр, свежие огурцы, оранжевое тобико, нори",
                price: "377 ₽"
            ),
             CatalogModel(
                image: "onigirifiladelfia",
                title: "Онигири Филадельфия",
                description: "лосось «спайси», суси рис, сливочный сыр, огурцы свежие, черное тобико с кунжутом, нори",
                price: "377 ₽"
             ),
             CatalogModel(
                image: "onigirimarygo",
                title: "Онигири Магуро",
                description: "тунец, суси рис, трюфельная паста, свежие огурцы, авокадо, белый кунжут, нори",
                price: "377 ₽"
             ),
             CatalogModel(
                image: "onigiridragon",
                title: "Онигири Дракон",
                description: "копченый угорь «спайси», суси рис, авокадо, сливочный сыр, бордовая масаго, нори",
                price: "377 ₽"
             ),
             CatalogModel(
                image: "onigirishiodzuki",
                title: "Онигири Шиодзуки",
                description: "слабосоленая форель, суси рис, свежие огурцы, бордовая масаго, нори",
                price: "377 ₽"
             ),
             CatalogModel(
                image: "onigirimaryaki",
                title: "Онигири Маруяки",
                description: "форель горячего копчения, суси рис, сливочный сыр, свежий огурец, тартар соус, зеленая масаго, нори",
                price: "377 ₽"
             )
        ],
        
        // Роллы
        [
            CatalogModel(
                image: "filadelfiaprime",
                title: "Филадельфия Прайм",
                description: "ролл в слайсах лосося, сыр, авокадо, рис для суси, нори, васаби (8 шт.)",
                price: "580 ₽"
            ),
             CatalogModel(
                image: "oritsymaki",
                title: "О рицу маки",
                description: "лосось, красная икра, сыр, рис для суси, нори, васаби (6 шт.)",
                price: "725 ₽"
             ),
             CatalogModel(
                image: "richrolls",
                title: "РичРолл",
                description: "ролл в слайсах тунца и лосося, спайси угорь, сыр, огурец, авокадо, снежный краб, рис для суси, нори, масаго, васаби (8 шт.)",
                price: "663 ₽"
             ),
             CatalogModel(
                image: "filadelfia",
                title: "Филадельфия",
                description: "лосось, огурец, сыр, зеленый лук, рис для суси, нори, кунжут, тобико, васаби (8 шт.)",
                price: "652 ₽"
             ),
             CatalogModel(
                image: "california",
                title: "Калифорния",
                description: "мясо краба, огурец, авокадо, рис для суси, нори, тобико, васаби (8 шт.)",
                price: "663 ₽"
             ),
             CatalogModel(
                image: "ynagicalifornia",
                title: "Унаги Филадельфия",
                description: "копченый угорь, сыр, спайси лосось «Бури», авокадо, тобико, тамаго, рис для суси, нори, васаби (6 шт.)",
                price: "663 ₽"
             ),
             CatalogModel(
                image: "syakedeluxe",
                title: "Сякэ де люкс",
                description: "лосось, авокадо, сыр, кунжут, рис для суси, нори. «Спайси»: гребешок, угорь, тунец, креветки, лосось, краб. Угорь с куриным филе, креветка с авокадо, васаби (8 шт.)",
                price: "684 ₽"
             ),
             CatalogModel(
                image: "losangeles",
                title: "Лос-Анджелес",
                description: "тигровые креветки в темпуре, лосось в соусе «спайси», авокадо,рис для суси, мамэнори, тобико, соус «Динамит», васаби (6 шт.)",
                price: "673 ₽"
             ),
             CatalogModel(
                image: "dragonrory",
                title: "Дракон рору",
                description: "копченый угорь,авокадо, сыр, темпурная крошка, масаго, рис для суси, нори, соус «Унаги», васаби (7 шт.)",
                price: "725 ₽"
             ),
             CatalogModel(
                image: "taigarory",
                title: "Тайга рору",
                description: "опаленный лосось, копченый угорь, масаго, темпурная крошка, рис для суси, нори, тамаго, огурец, васаби (7 шт.)",
                price: "684 ₽"
             ),
             CatalogModel(
                image: "salmoncaramel",
                title: "Ролл Лосось-карамель",
                description: "карамелизированный лосось с морской солью, сыром, копченым угрем с соусом «Спайси», рис для суси, нори, масаго и тамаго, васаби (8 шт.)",
                price: "621 ₽"
             ),
             CatalogModel(
                image: "bluecheeseroll",
                title: "Блю чиз ролл",
                description: "запеченный лосось, копченый угорь, огурец, сыр, соус из голубого сыра, рис для суси, нори, васаби (7 шт.)",
                price: "611 ₽"
             ),
             CatalogModel(
                image: "osakamaki",
                title: "Осака маки",
                description: "лосось, сыр, огурец, рис для суси, нори, васаби (6шт.)",
                price: "684 ₽"
             ),
             CatalogModel(
                image: "aidahomaki",
                title: "Айдахо маки",
                description: "снежный краб, авокадо, огурец, рис для суси, нори, масаго, васаби (8 шт.)",
                price: "517 ₽"
             ),
             CatalogModel(
                image: "balimaki",
                title: "Бали маки",
                description: "тигровые креветки в рисовой панировке, обжаренный лосось, манго, тобико, рис для суси, нори, соус «Унаги», васаби (7 шт.)",
                price: "704 ₽"
             ),
             CatalogModel(
                image: "kiotorory",
                title: "Киото рору",
                description: "лосось, сыр, рис для суси, нори, красная икра, васаби (8 шт.)",
                price: "475 ₽"
             ),
             CatalogModel(
                image: "ninjarory",
                title: "Нидзя рору",
                description: "копченый угорь, лосось, огурец, сыр, тамаго, рис для суси, нори, масаго, васаби (8 шт.)",
                price: "475 ₽"
             ),
             CatalogModel(
                image: "paradiserory",
                title: "Парадайз рору",
                description: "лосось, красная икра, сыр, авокадо,рис для суси, масаго, мамэнори, васаби (6 шт.)",
                price: "517 ₽"
             ),
             CatalogModel(
                image: "reddragon",
                title: "Red Драгон",
                description: "копченый угорь, сыр, темпурная крошка, огурец, спайси лосось «Бури», рис для суси, нори, в оранжевой масаго, васаби (8 шт.)",
                price: "621 ₽"
             ),
             CatalogModel(
                image: "syakecalifornia",
                title: "Сякэ Калифорния",
                description: "лосось, огурец, авокадо, рис для суси, нори, тобико, васаби (8 шт.)",
                price: "569 ₽"
             ),
             CatalogModel(
                image: "spicycanirory",
                title: "Спайси кани рору",
                description: "краб в соусе ⟪Спайси⟫, рис для суси, нори, васаби (6 шт.)",
                price: "621 ₽"
             ),
             CatalogModel(
                image: "spicycanirory",
                title: "Спайси магуро рору",
                description: "тунец в соусе ⟪Спайси⟫, рис для суси, нори, васаби (6 шт.)",
                price: "448 ₽"
             ),
             CatalogModel(
                image: "spicycyakerory",
                title: "Спайси сякэ рору",
                description: "лосось в соусе ⟪Спайси⟫, рис для суси, нори, васаби (6 шт.)",
                price: "415 ₽"
             ),
             CatalogModel(
                image: "spicyynagirory",
                title: "Спайси унаги рору",
                description: "копченый угорь в соусе ⟪Спайси⟫, рис для суси, нори, васаби (6 шт.)",
                price: "415 ₽"
             ),
             CatalogModel(
                image: "syakerory",
                title: "Сякэ рору",
                description: "лосось, рис для суси, нори, васаби (6 шт.)",
                price: "415 ₽"
             ),
             CatalogModel(
                image: "tekka",
                title: "Тэкка",
                description: "тунец, рис для суси, нори, васаби (6 шт.)",
                price: "415 ₽"
             ),
             CatalogModel(
                image: "kappamaki",
                title: "Каппа маки",
                description: "огурец, рис для суси, нори, (6 шт.)",
                price: "280 ₽"
             ),
             CatalogModel(
                image: "abogadorory",
                title: "Абогадо рору",
                description: "авокадо, рис для суси, нори, кунжут (6 шт.)",
                price: "288 ₽"
             ),
             CatalogModel(
                image: "ynagirory",
                title: "Унаги рору",
                description: "копченый угорь, огурец, рис для суси, нори, соус «унаги», кунжут, васаби (6 шт.)",
                price: "415 ₽"
             )
        ],
        
        // Горячие роллы
        [
            CatalogModel(
                image: "yakisyakarory",
                title: "Яки сякэ рору",
                description: "лосось в соусе «Спайси», сыр ⟪Эдам⟫, сыр, рис для суси, нори, кунжут, тобико, соус «Терияки», васаби (8 шт.)",
                price: "580 ₽"
            ),
            CatalogModel(
                image: "kaisanmakiage",
                title: "Кайсэн маки агэ",
                description: "снежный краб, авокадо, масаго, сыр, рис для суси, мамэнори, темпура. Сервируется с цитрусовым соусом «Спайси» (6 шт.)",
                price: "548 ₽"
            ),
            CatalogModel(
                image: "kaisanmakiage",
                title: "Персона грата",
                description: "копченый угорь, сыр, авокадо, масаго, рис для суси, кунжут, темпура, соус «спайси». Сервируется цитрусовым соусом «спайси» (4 шт.)",
                price: "600 ₽"
            ),
            CatalogModel(
                image: "pinksyakirory",
                title: "Пинк сякэ рору",
                description: "копченый лосось, копченый угорь, рис для суси, мамэнори, авокадо, огурец, соус «спайси», темпура, соус «Васаби», васаби (5 шт.)",
                price: "548 ₽"
            ),
            CatalogModel(
                image: "rosygragonmaki",
                title: "Росу драгон маки",
                description: "копченый угорь, авокадо, масаго, сыр, тамаго, рис для суси, мамэнори, темпура. Сервируется с цитрусовым соусом «спайси» (6 шт.)",
                price: "623 ₽"
            ),
            CatalogModel(
                image: "sacramentomaki",
                title: "Сакраменто маки",
                description: "снежный краб, омлет, дикий лосось-гриль, сыр, рис для суси, сыр «Эдам», васаби (8 шт.)",
                price: "600 ₽"
            ),
            CatalogModel(
                image: "syakiteriyakirory",
                title: "Сякэ терияки рору",
                description: "лосось, снежный краб, авокадо, огурец, рис для суси, нори, кунжут, соус «Терияки», васаби (6 шт.)",
                price: "580 ₽"
            ),
            CatalogModel(
                image: "yakiunagirory",
                title: "Яки унаги рору",
                description: "копченый угорь в соусе «Спайси», рис для суси, нори, сыр ⟪Эдам⟫, сыр, кунжут, тобико, соус «Терияки», васаби (8 шт.)",
                price: "580 ₽"
            )
        ],
        
        // Сеты
        [
            CatalogModel(
                image: "setbenefit",
                title: "Сет Бенефит",
                description: "Айдахо маки (8шт), Калифорния с лососем (8шт), Киото рору (8шт), Нидзя рору (8шт),Спайси лосось (6 шт), Каппа маки (6 шт), Спайси унаги (6 шт), Спайси тунец (6 шт), Red Драгон (8 шт), Бали маки (7 шт), Тайга рору (7 шт) - 11 порций роллов (78 шт.)",
                price: "5 612 ₽"
            ),
            CatalogModel(
                image: "setsakura",
                title: "Сакура сет",
                description: "Калифорния с крабом (8 шт.), Айдахо маки (8 шт.), Бали маки (7 шт.), Филадельфия (8 шт.), Киото рору (8 шт.), Сякэ Калифорния (8 шт.) - 6 порций роллов (47 шт.)",
                price: "3 632 ₽"
            ),
            CatalogModel(
                image: "setsugrem",
                title: "Сет с угрем",
                description: "Нидзя рору (8 шт.), Red Драгон (8 шт.), Драгон рору (7 шт.), Унаги рору (6 шт.) - 4 порции роллов (29 шт.)",
                price: "2 226 ₽"
            ),
            CatalogModel(
                image: "setslososem",
                title: "Сет с лососем",
                description: "О рицу маки (6 шт.), Киото рору (8 шт.), Филадельфия (8 шт.), Сякэ рору (6 шт.) - 4 порции роллов (28 шт.)",
                price: "2 267 ₽"
            ),
            CatalogModel(
                image: "grillset",
                title: "Гриль-сет",
                description: "Сякэ терияки рору (8шт), Яки унаги рору (8шт), Яки сякэ рору (8шт), Сакраменто маки (8шт)- 4 порции роллов (32 шт.)",
                price: "2 317 ₽"
            ),
            CatalogModel(
                image: "settempura",
                title: "Темпура-сет",
                description: "Кайсэн маки агэ (6 шт.), Росу драгон маки (6 шт.), Персона грата (4 шт.), Пинк сякэ рору (5 шт.) - 4 порции роллов (21 шт.)",
                price: "2 319 ₽"
            ),
            CatalogModel(
                image: "setclassic",
                title: "Сет Классик",
                description: "Филадельфия (8 шт.), Калифорния с крабом (8 шт.), Сякэ рору (6 шт.), Унаги рору (6 шт.), Каппа маки (6 шт.) - 5 порций роллов (34 шт.)",
                price: "2 425 ₽"
            )
        ],
        
        // Напитки
        [
            CatalogModel(
                image: "limonadcrizhovniklichi",
                title: "Лимонад Крыжовник-Личи",
                description: "пюре крыжовника, пюре личи, сироп бузины, яблочный сок, сок лимона, содовая",
                price: "397 ₽"
            ),
            CatalogModel(
                image: "limonadmandarinkracnayasmorodina",
                title: "Лимонад Мандарин-Красная смородина",
                description: "пюре мандарина, пюре красной смородины, яблочный сок, сироп грейпфрута, лимонад лимон-лайм",
                price: "397 ₽"
            ),
            CatalogModel(
                image: "limonadskyblue",
                title: "Лимонад Скай блю",
                description: "пюре личи, сок лимона, сироп Блю Кюрасао, спрайт, перламутр",
                price: "397 ₽"
            ),
            CatalogModel(
                image: "limonadmintmarakya",
                title: "Лимонад «Мята-Маракуйя»",
                description: "пюре маракуйи, мята, сахарный сироп, лед фраппе, содовая",
                price: "397 ₽"
            ),
            CatalogModel(
                image: "limonadmarakyabublegum",
                title: "Лимонад «Маракуйя-Бабл-гам»",
                description: "пюре маракуйи, сироп Бабл-Гам, сироп алычи, сироп Гренадин, сироп сахарный, лимонный фреш, лед фраппе, содовая",
                price: "397 ₽"
            ),
            CatalogModel(
                image: "teafeixoalichi",
                title: "Чай Фейхоа - Личи",
                description: "пюре личи, пюре фейхоа, тайский синий чай, грейпфрутовый сироп",
                price: "427 ₽"
            ),
            CatalogModel(
                image: "teaoblepixa",
                title: "Чай Облепиха - Маракуя",
                description: "ягоды облепихи, пюре маракуйи, мята, апельсин, зеленый чай",
                price: "387 ₽"
            ),
            CatalogModel(
                image: "coffeeglyaseice",
                title: "Кофе «Гляссе Айс»",
                description: "кофе, молоко,  мороженое, сахарный сироп, какао, лед",
                price: "387 ₽"
            ),
            CatalogModel(
                image: "smuziananasmalina",
                title: "Смузи «Ананас-Малина»",
                description: "ананасовый сок, малина, банан, сироп алычи, лед",
                price: "377 ₽"
            ),
            CatalogModel(
                image: "smuzilesnuiyagodimix",
                title: "Смузи «Лесные Ягоды микс»",
                description: "ягоды смородины, ежевики, малины, вишневый сок, сироп бузины, сироп сахарный, пюре клюквы, лед фраппе",
                price: "377 ₽"
            ),
            CatalogModel(
                image: "smuzisheiktropikana",
                title: "Смузи «Шейк Тропикана»",
                description: "пюре манго, сироп манго, ананасовый сок, кокосовый сироп, кокосовое молоко, лед фраппе",
                price: "377 ₽"
            ),
            CatalogModel(
                image: "smuzipinakoladamix",
                title: "Смузи «Пина Колада микс»",
                description: "ананасовый сок, кокосовое молоко, кокосовый сироп, банан, сироп Бабл Гам, лед",
                price: "287 ₽"
            ),
            CatalogModel(
                image: "morsoblepixa",
                title: "Морс Облепиховый",
                description: "облепиха, сахар, вода",
                price: "287 ₽"
            ),
            CatalogModel(
                image: "morschernosmorodina",
                title: "Морс Черносмородиновый",
                description: "черная смородина, сахар, вода",
                price: "287 ₽"
            ),
            CatalogModel(
                image: "morsclucva",
                title: "Морс Клюквенный",
                description: "клюква, сахар, вода",
                price: "287 ₽"
            )
        ],
        
        // Соусы
        [
            CatalogModel(
            image: "vasabi",
            title: "Васаби",
            description: "японский хрен",
            price: "60 ₽"
            ),
            CatalogModel(
            image: "imbirmarinovaniu",
            title: "Имбирь маринованный",
            description: "имбирь, вода, соль, регуляторы кислотности, кислота уксусная, кислота лимонная, консервант сорбат калия, усилитель вкуса и аромата глутамат натрия, подсластители",
            price: "60 ₽"
            ),
            CatalogModel(
                image: "soeviusoys",
                title: "Соевый соус",
                description: "вода, соевые бобы, пшеница, соль, сахар",
                price: "60 ₽"
            )
        ]
    ]
}
