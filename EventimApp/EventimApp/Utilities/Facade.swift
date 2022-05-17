//
//  Facade.swift
//  EventimApp
//
//  Created by Piotr Waś on 12/04/2022.
//

import Foundation

class Facade {
    var myTickets: [Ticket]
    var realmManager = RealmManager()
    init(myTickets: [Ticket]) {
        self.myTickets = myTickets
    }
    
    public func Procedure() {
        buyTickets()
        BasketSingleton.basket.clearBasket()
    }
    
    func buyTickets() {
        let basket = BasketSingleton.basket.returnAll()
        if basket.count != 0 {
            for ticket in basket {
                realmManager.addTicket(ticket: ticket)
                //MyTickets.TicketsArray.append(ticket)
            }
        }
    }
}
