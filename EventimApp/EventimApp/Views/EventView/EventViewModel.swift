//
//  EventViewModel.swift
//  EventimApp
//
//  Created by Piotr Waś on 17/05/2022.
//

import Foundation

final class EventViewModel: ObservableObject {
    
    func checkIfAnyInBasket(basket: BasketSingleton, event: Event) -> Bool {
        if basket.makeIterator().countTickets(s: event.name) > 0 {
            return true
        }
        else {
            return false
        }
    }
    
    func addTheatreTicket(basket: BasketSingleton, event: Event) {
        basket.items.append(TheatreTicketFactory().createTicket(name: event.name, type: event.type, date: event.date, price: event.price))
    }
    
    func addConcertTicket(basket: BasketSingleton, event: Event) {
        basket.items.append(ConcertTicketFactory().createTicket(name: event.name, type: event.type, date: event.date, price: event.price))
    }
    
    func defImage(e: Event) -> String {
        if e.type == "Koncert"{
            return "concert"
        }
        else if e.type == "Spektakl" {
            return "theatre"
        }
        return "none"
    }
    
    func addToBasket(basket: BasketSingleton, event: Event) {
        if event.type == "Spektakl" {
            addTheatreTicket(basket: basket, event: event)
        }
        else {
            addConcertTicket(basket: basket, event: event)
        }
    }

}
