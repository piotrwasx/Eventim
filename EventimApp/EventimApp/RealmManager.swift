//
//  RealmManager.swift
//  EventimApp
//
//  Created by Piotr Waś on 09/05/2022.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published private(set) var tickets: [TicketSchema] = []
    
    init() {
        openRealm()
        getTickets()
    }
    
    func openRealm(){
        do{
            
            let config = Realm.Configuration(schemaVersion: 1, migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 1) {
                }
                
            })
            
            Realm.Configuration.defaultConfiguration = config
            localRealm = try Realm()
            
        } catch{
            print("Error opening Realm: \(error)")
        }
    }
    
    func addTicket(ticket: Ticket){
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newTicket = TicketSchema(value: ["name": ticket.name, "type": ticket.type, "date": ticket.date, "price": ticket.price])
                    localRealm.add(newTicket)
                    getTickets()
                    print("Added new ticket! \(newTicket)")
                }
            }
            catch {
                print("Error adding new ticket: \(error)")
            }
            
        }
    }
    
    func getTickets(){
        if let localRealm = localRealm {
            do {
                let allTickets = localRealm.objects(TicketSchema.self)
                tickets = []
                allTickets.forEach{ticket in
                    tickets.append(ticket)
                }
            }
        }
    }
    
    func deleteTicket(id: UUID) {
        if let localRealm = localRealm {
            do {
                let ticketToDelete = localRealm.objects(TicketSchema.self).filter("id == %@", id)
                guard !ticketToDelete.isEmpty else { return }
                
                try localRealm.write{
                    localRealm.delete(ticketToDelete)
                    getTickets()
                    print("Deleted ticket id: \(id)")
                }
            }
            catch {
                print("Error deleting ticket id: \(id) from Realm \(error) ")
            }
        }
    }
}
