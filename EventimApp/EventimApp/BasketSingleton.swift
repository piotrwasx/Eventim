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
    
    var items = [Ticket]()

    // create a private initializer
    private init() {
    }

    func showBasket() -> String {
        var bskt = ""
        for item in items {
            bskt += item.toString()
            bskt += "\n=======\n"
        }
        return bskt
    }
    
    func countBasket() -> Int {
        return items.count
    }
    
    func addToBasket(t: Ticket) {
        items.append(t)
    }
    
    func clearBasket() {
        items.removeAll()
    }
}
