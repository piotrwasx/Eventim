//
//  TicketListView.swift
//  EventimApp
//
//  Created by Piotr Waś on 21/03/2022.
//

import SwiftUI

struct EventListView: View {
    var events: [Event] = EventList.someEvents
    var concertEvents = ShowConcert(events: EventList.someEvents)
    var theatreEvents = ShowTheatre(events: EventList.someEvents)
    @State var a: [Event] = []
    
    var body: some View {
        VStack {
            HeaderView()
                .frame(height: 120)
            
            HStack() {
                Button("Koncerty", action: {
                    a = concertEvents.filter()
                }).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                Button("Spektakle", action: {
                    a = theatreEvents.filter()
                }).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            
            NavigationView {
                
                VStack {
                    List(a, id: \.id) { event in
                        NavigationLink(
                            destination: EventView(event: event),
                            label: {
                                VStack {
                                    Text(event.name)
                                }
                            })
                    }
                    .font(.title)
                    
                    NavigationLink(
                        destination: BasketView(),
                        label: {
                            VStack {
                                Text("Przejedź do koszyka")
                                    .font(.title)
                            }
                            
                        })
                    
                }
                .navigationTitle("Dostępne bilety")
            }
            Spacer()
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            EventListView()
        }
    }
}
