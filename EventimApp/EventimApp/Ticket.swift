//
//  Ticket.swift
//  EventimApp
//
//  Created by Piotr Waś on 21/03/2022.
//

import Foundation

protocol Creator {
    func factoryMethod() -> Product
    
    func someOperation() -> String
    
}

extension Creator {

    func someOperation() -> String {
        let product = factoryMethod()

        return "Creator: The same creator's code has just worked with " + product.operation()
    }
}

class Concert: Creator {

    public func factoryMethod() -> Product {
        return ConcertTicket()
    }
}


protocol Product {

    func operation() -> String
}

class ConcertTicket: Product {

    func operation() -> String {
        return "{Result of the ConcreteProduct1}"
    }
}






protocol TicketFactory {
    func create() -> Ticket
}

protocol Ticket {
    var name: String { get set }
    var type: String { get }
    var quantity: Int { get }
    var date: String { get set }
    var price: Float { get set }
}

class TheatreTicket: Ticket {
    var name: String    = ""
    var type: String    = "Performance"
    var quantity: Int   = 1
    var date: String    = ""
    var price: Float    = 0.0
}
