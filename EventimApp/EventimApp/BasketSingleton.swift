//
//  BasketSingleton.swift
//  EventimApp
//
//  Created by Piotr Waś on 21/03/2022.
//

import Foundation
import SwiftUI

//protocol Basket {
//    var items: [Ticket] { get }
//}

class BasketSingleton: Iterable, ObservableObject {
    
    
    static let basket = BasketSingleton()
    
    @Published var items = [Ticket]()
    
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
    func returnAll() -> [Ticket]{
        return items
    }
    
    func addToBasket(t: Ticket) {
        items.append(t)
    }
    
    func clearBasket() {
        items.removeAll()
    }
    
    func countPrice() -> Float {
        var sum: Float = 0
        for item in items {
            sum += item.price
        }
        return sum
    }
    
    func makeIterator() -> TicketIterator {
        return ArrayTicketIterator(self.items)
    }
    
}
