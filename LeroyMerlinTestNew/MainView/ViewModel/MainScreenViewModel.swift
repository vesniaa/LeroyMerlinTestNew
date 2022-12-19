//
//  MainScreenViewModel.swift
//  LeroyMerlinTestNew
//
//  Created by Евгения Аникина on 19.12.2022.
//

import Foundation

class TabsVM: ObservableObject {
    
    @Published var tabsVM = TabsM(image: ["Главная","Мой список","Магазины","Профиль","Корзина"])
    
}

var cataloges = [
   CatalogM(asset: "Каталог", title: "Каталог"),
   CatalogM(asset: "Новогодние товары", title: "Новогодние товары"),
   CatalogM(asset: "Сад", title: "Сад"),
   CatalogM(asset: "Освещение", title: "Освещение"),
   CatalogM(asset: "Декор", title: "Декор"),
   CatalogM(asset: "Инструменты", title: "Инструменты"),
   CatalogM(asset: "Смотреть все", title: "Смотреть еще"),
]

var bestPrices = [
    BestPriceM(asset: "Обои", title: "Обои флизиленовые"),
    BestPriceM(asset: "Кашпо", title: "Кашпо Idea Дюна 34 х 63 см"),
    BestPriceM(asset: "Средство для мытья", title: "Средство для мытья стекол"),
    BestPriceM(asset: "Средство", title: "Средство для акриловых ван"),
    BestPriceM(asset: "Салфетки", title: "Салфетки 35х35 см, микрофибрационные"),
    BestPriceM(asset: "Лоток", title: "Лоток для столовых приборов"),
    BestPriceM(asset: "Стеллаж", title: "Стеллаж Кабуки 60х201х28 см"),
    BestPriceM(asset: "Лак", title: "Лак для мебели V33 ангора 0,5 л"),
    BestPriceM(asset: "Гель", title: "Гель для чистки унитаза"),
    BestPriceM(asset: "Салфетка", title: "Салфетка для стекол и зеркал"),
]

var limitedOffers = [
        LimitedOfferM(asset: "Керамогранит", title: "Керамогранит Euroceramika"),
        LimitedOfferM(asset: "Штукатурка", title: "Штукатурка гипсовая Knauf"),
        LimitedOfferM(asset: "Грунтовка", title: "Грунтовка глубокого проникновения"),
        LimitedOfferM(asset: "Перфоратор", title: "Перфоратор SDS-plus Makita"),
        LimitedOfferM(asset: "Шпаклевка", title: "Шпаклевка полимерная"),
        LimitedOfferM(asset: "Пена монтажная", title: "Пена монтажная пистолетная Axton"),
        LimitedOfferM(asset: "Уровень лазерный", title: "Уровень лазерный Bosch"),
        LimitedOfferM(asset: "Подрозетник", title: "Подрозетник IEK для твердых"),
        LimitedOfferM(asset: "Ламинат", title: "Ламинат Artens <Тангай> 33")
]

var newYears = [
    LimitedOfferM(asset: "Керамогранит", title: "Керамогранит Euroceramika"),
    LimitedOfferM(asset: "Штукатурка", title: "Штукатурка гипсовая Knauf"),
    LimitedOfferM(asset: "Грунтовка", title: "Грунтовка глубокого проникновения"),
    LimitedOfferM(asset: "Перфоратор", title: "Перфоратор SDS-plus Makita"),
    LimitedOfferM(asset: "Шпаклевка", title: "Шпаклевка полимерная"),
    LimitedOfferM(asset: "Пена монтажная", title: "Пена монтажная пистолетная Axton"),
    LimitedOfferM(asset: "Уровень лазерный", title: "Уровень лазерный Bosch"),
    LimitedOfferM(asset: "Подрозетник", title: "Подрозетник IEK для твердых"),
    LimitedOfferM(asset: "Ламинат", title: "Ламинат Artens <Тангай> 33")
]
