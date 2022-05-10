//
//  Ticket.swift
//  EventimApp
//
//  Created by Piotr Waś on 21/03/2022.
//

import Foundation

protocol TicketFactory {
    func createTicket(name: String, type: String, date: String, price: Float) -> Ticket
}

class Ticket: Identifiable {
    var name: String
    var type: String
    var date: String
    var price: Float
    
    init(name: String, type: String, date: String, price: Float) {
        self.name = name
        self.type = type
        self.date = date
        self.price = price
    }
    
    func toString() -> String{
        return "nazwa: \(self.name) \n rodzaj: \(self.type) \n data: \(self.date) \n cena: \(self.price)"
    }
}

class TheatreTicket: Ticket {
    var seat_type: String = ""
    
    override func toString() -> String{
        return "nazwa: \(self.name) \n rodzaj: \(self.type) \n data: \(self.date) \n cena: \(self.price) \n rodzaj miejsca: \(self.seat_type)"
    }
    
    func changeSeatType(s: String) {
        self.seat_type = s
    }

}

class ConcertTicket: Ticket {
    
    override func toString() -> String {
        return "nazwa: \(self.name) \n rodzaj: \(self.type) \n data: \(self.date) \n cena: \(self.price)"
    }
}

class TheatreTicketFactory: TicketFactory {
    func createTicket(name: String, type: String, date: String, price: Float) -> Ticket {
        return TheatreTicket(name: name, type: type, date: date, price: price)
    }
}

class ConcertTicketFactory: TicketFactory {
    func createTicket(name: String, type: String, date: String, price: Float) -> Ticket {
        return ConcertTicket(name: name, type: type, date: date, price: price)
    }
}
