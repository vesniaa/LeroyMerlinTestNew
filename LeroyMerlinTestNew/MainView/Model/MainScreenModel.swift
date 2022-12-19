//
//  MainScreenModel.swift
//  LeroyMerlinTestNew
//
//  Created by Евгения Аникина on 19.12.2022.
//

import Foundation

struct TabsM {
    
    var image: [String]
    
}

struct CatalogM {
    
    var id = UUID().uuidString
    var asset : String
    var title: String
    
}

struct BestPriceM {
    
    var id = UUID().uuidString
    var asset : String
    var title: String
    
}

struct LimitedOfferM {
    
    var id = UUID().uuidString
    var asset : String
    var title: String
    
}
