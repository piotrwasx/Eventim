//
//  TicketListView.swift
//  EventimApp
//
//  Created by Piotr Waś on 21/03/2022.
//

import SwiftUI

struct EventListView: View {
    var events: [Event] = EventList.someEvents
    var body: some View {
        VStack {
            HeaderView()
                .frame(height: 100)
            
            NavigationView {
                
                VStack {
                    
                    List(events, id: \.id) { event in
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
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            }
                        })
                }
                .navigationTitle("Dostępne bilety")
                
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            EventListView()
        }
    }
}
