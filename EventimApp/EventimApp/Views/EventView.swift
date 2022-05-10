//
//  TicketView.swift
//  EventimApp
//
//  Created by Piotr Waś on 21/03/2022.
//

import SwiftUI
import Foundation

struct EventView: View {
    var event: Event
    let theatre = TheatreTicketFactory()
    let concert = ConcertTicketFactory()
    @StateObject var basket = BasketSingleton.basket
    
    var body: some View {
        VStack {
            ZStack{
                Image(defImage(e: event))
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                if basket.makeIterator().countTickets(s: event.name) > -1 {
                    
                    QunatityView(event: event.name, basket: basket)
                        .environmentObject(basket)
                        .position(x: 270, y: 60)
                    
                }
            }
            .frame(width: 370, height: 250, alignment: .center)
            
            VStack(alignment: .leading){
                Text(event.name)
                    .font(.system(size: 42))
                    .fontWeight(.heavy)
                Text(event.date)
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                Text(event.type)
                    .font(.system(size: 26))
                    .fontWeight(.light)
                Text("\(String(format: "%.2f",(event.price))) zł")
                    .font(.system(size: 15))
            }
            Spacer()
            
            if event.type == "Spektakl" {
                Button("Dodaj do koszyka", action: {
                    basket.items.append(theatre.createTicket(name: event.name, type: event.type, date: event.date, price: event.price))
                }).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            else {
                Button("Dodaj do koszyka", action: {
                    basket.items.append(concert.createTicket(name: event.name, type: event.type, date: event.date, price: event.price))
                }).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
        }
    }
    
    func defImage(e: Event) -> String {
        if e.type == "Koncert"{
            return "concert"
        }
        else if e.type == "Spektakl" {
            return "theatre"
        }
        return "none"
    }
    
    struct TicketView_Previews: PreviewProvider {
        static var previews: some View {
            EventView(event: EventList.someEvents[3])
                .environmentObject(BasketSingleton.basket)
        }
    }
}
