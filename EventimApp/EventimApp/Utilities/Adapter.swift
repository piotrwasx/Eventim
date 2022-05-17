//
//  Adapter.swift
//  EventimApp
//
//  Created by Piotr Waś on 11/04/2022.
//

import Foundation

class Target {
    func method() -> String {
        return "Brak biletów"
    }
}

class Adaptee {
    var realmManager = RealmManager()
    func prettyPrint() -> String {
        var output: String = ""
        for ticket in realmManager.tickets {
            output += "nazwa: \(ticket.name)\ndata: \(ticket.date)\ntyp: \(ticket.type)\ncena: \(ticket.price) \n\n"
        }
        return output
    }
}

class Adapter: Target {
    private var adaptee: Adaptee
    var realmManager = RealmManager()
    
    init(_ adaptee: Adaptee) {
        self.adaptee = adaptee
    }
    
    override func method() -> String {
        if realmManager.tickets.count == 0 {
            let t = Target()
            return t.method()
        }
        else{
            return adaptee.prettyPrint()
        }
    }
    
}

