//
//  BasketSingleton.swift
//  EventimApp
//
//  Created by Piotr Waś on 21/03/2022.
//

import Foundation

class BasketSingleton {

    // create a singleton
    static let basket = BasketSingleton()
    
    var items = [Event]()

    // create a private initializer
    private init() {
    }

    func showBasket() -> String {
        var bskt = "=======\n"
        for item in items {
            bskt += item.toString()
            bskt += "\n=======\n"
        }
        return bskt
    }
    
    func countBasket() -> Int {
        return items.count
    }
    
    func addToBasket(e: Event) {
        items.append(e)
    }
    
    func clearBasket() {
        items.removeAll()
    }
}
