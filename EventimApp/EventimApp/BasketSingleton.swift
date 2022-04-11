//
//  BasketSingleton.swift
//  EventimApp
//
//  Created by Piotr Waś on 21/03/2022.
//

import Foundation

class BasketSingleton: Iterable {
    
    
    static let basket = BasketSingleton()
    
    var items = [Ticket]()
    
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
    
    func addToBasket(t: Ticket) {
        items.append(t)
    }
    
    func clearBasket() {
        items.removeAll()
    }
    
    func makeIterator() -> TicketIterator {
        return ArrayTicketIterator(self.items)
    }
    
}
