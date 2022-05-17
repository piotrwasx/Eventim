//
//  MyTickets.swift
//  EventimApp
//
//  Created by Piotr Waś on 12/04/2022.
//

import SwiftUI

class MyTickets {
    
    static let myTickets = MyTickets()
    
    private init() {
    }
    
    func toString() -> String {
        var output: String = ""
        for ticket in MyTickets.TicketsArray {
            output += ticket.toString()
            output += "\n \n"
        }
        return output
    }

    static var TicketsArray: [Ticket] = []
}
