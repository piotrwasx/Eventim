//
//  TicketView.swift
//  EventimApp
//
//  Created by Piotr Waś on 21/03/2022.
//

import SwiftUI

struct EventView: View {
    var event: Event
    
    var body: some View {
        VStack {
            Text(event.name)
                .font(.title)
                .fontWeight(.bold)
                Text(event.date).font(.body)
            Text(event.type).font(.body)
            Text("\(event.price) zł").font(.body)
            Spacer()
        
            Button("Dodaj do koszyka", action: {
                BasketSingleton.basket.items.append(event)
            }).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
        }
    }
    
struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(event: EventList.someEvents.first!)
        }
    }
}
