//
//  Iterator.swift
//  EventimApp
//
//  Created by Piotr Waś on 11/04/2022.
//

import Foundation

protocol TicketIterator {
    func next() -> Ticket?
    func countTickets(s: String) -> Int
    func actualIndex() -> Int?
}

class ArrayTicketIterator: TicketIterator {

    private let values: [Ticket]
    private var index: Int?

    init(_ values: [Ticket]) {
        self.values = values
    }
    
    func actualIndex() -> Int? {
        return index
    }
    
    func countTickets(s: String) -> Int {
        var count = 0
        for value in values {
            if(value.name == s) {
                count += 1
            }
        }
        
        return count
    }

    private func nextIndex(for index: Int?) -> Int? {
        if let index = index, index < self.values.count - 1 {
            return index + 1
        }
        if index == nil, !self.values.isEmpty {
            return 0
        }
        return nil
    }

    func next() -> Ticket? {
        if let index = self.nextIndex(for: self.index) {
            self.index = index
            return self.values[index]
        }
        return nil
    }
}


protocol Iterable {
    func makeIterator() -> TicketIterator
}
