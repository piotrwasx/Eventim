//
//  TampleMethod.swift
//  EventimApp
//
//  Created by Piotr Waś on 11/04/2022.
//
import SwiftUI
import Foundation

protocol TampleMethod {
    var events: [Event] {get}
    var type: String {get}
}

extension TampleMethod {
    func filter() -> [Event] {
        var s: [Event] = []
        for single in events {
            if single.type == self.type {
                s.append(single)
            }
        }
        return s
    }
}

class ShowConcert: TampleMethod {
    var events: [Event] = EventList.someEvents
    var type = "Koncert"
    
    init(events: [Event]) {
        self.events = events
    }
    
}

class ShowTheatre: TampleMethod {
    var events: [Event] = EventList.someEvents
    var type = "Spektakl"
    
    init(events: [Event]) {
        self.events = events
    }
    
}

class ShowAll: TampleMethod {
    var events: [Event] = EventList.someEvents
    var type = ""
    
    init(events: [Event]) {
        self.events = events
    }
    
    func filter() -> [Event] {
        return events
    }
    
}
