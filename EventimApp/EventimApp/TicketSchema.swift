//
//  TicketSchema.swift
//  EventimApp
//
//  Created by Piotr Waś on 09/05/2022.
//

import Foundation
import RealmSwift

class TicketSchema: Object, Identifiable {
    @Persisted(primaryKey: true) var id: UUID
    @Persisted var name: String
    @Persisted var type: String
    @Persisted var date: String
    @Persisted var price: Float
}
