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
                .frame(height: 120)
            
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
