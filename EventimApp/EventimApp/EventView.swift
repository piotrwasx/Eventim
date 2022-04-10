//
//  TicketView.swift
//  EventimApp
//
//  Created by Piotr Waś on 21/03/2022.
//

import SwiftUI

struct EventView: View {
    var event: Event
    let theatre = TheatreTicketFactory()
    let concert = ConcertTicketFactory()
    
    var body: some View {
        VStack {
            Text(event.name)
                .font(.title)
                .fontWeight(.bold)
            Text(event.date).font(.body)
            Text(event.type).font(.body)
            Text("\(event.price) zł").font(.body)
            Spacer()
            
            if event.type == "Spektakl" {
                Button("Dodaj do koszyka", action: {
                    BasketSingleton.basket.items.append(theatre.createTicket(name: event.name, type: event.type, date: event.date, price: event.price))
                }).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            else if event.type == "Koncert" {
                Button("Dodaj do koszyka", action: {
                    BasketSingleton.basket.items.append(concert.createTicket(name: event.name, type: event.type, date: event.date, price: event.price))
                }).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
        }
    }
    
    struct TicketView_Previews: PreviewProvider {
        static var previews: some View {
            EventView(event: EventList.someEvents.first!)
        }
    }
}
