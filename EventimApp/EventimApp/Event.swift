//
//  Ticket.swift
//  EventimApp
//
//  Created by Piotr Waś on 21/03/2022.
//

import SwiftUI

class Event: Identifiable {
    init(name: String, quantity: Int, type: String, date: String, price: Float) {
        self.name = name
        self.quantity = quantity
        self.type = type
        self.date = date
        self.price = price
    }
    
    let id = UUID()
    let name: String
    let quantity: Int
    let type: String
    let date: String
    let price: Float
    
    func toString() -> String {
        return "nazwa: \(self.name) \n ilosc: \(self.quantity) \n rodzaj: \(self.type) \n data: \(self.date) \n cena: \(self.price)"
    }
}

struct EventList {
    
    static let someEvents = [
        Event(name: "Bruno Mars", quantity: 10000, type: "Koncert", date: "20-04-2022", price: 100.0),
        Event(name: "Jezioro Łabędzie", quantity: 200, type: "Spektakl", date: "10-05-2022", price: 50.0),
        Event(name: "Romeo i Julia", quantity: 100, type: "Spektakl", date: "15-05-2022", price: 45.5),
        Event(name: "Rihanna", quantity: 50000, type: "Koncert", date: "10-06-2022", price: 250.0),
        Event(name: "Krzyżacy", quantity: 50, type: "nieznany", date: "14-10-2022", price: 500.0)
    ]
}
