//
//  TicketListView.swift
//  EventimApp
//
//  Created by Piotr Waś on 21/03/2022.
//

import SwiftUI

struct EventListView: View {
    @State var a: [Event] = ShowAll(events: EventList.someEvents).filter()
    var concertEvents = ShowConcert(events: EventList.someEvents)
    var theatreEvents = ShowTheatre(events: EventList.someEvents)
    
    
    var body: some View {
        VStack {
            HeaderView()
                .frame(height: 120)
            
            NavigationView {
                
                VStack {
                    
                    List(a, id: \.id) {
                        event in
                        NavigationLink(
                            destination: EventView(event: event),
                            label: {
                                VStack {
                                    Text(event.name)
                                }
                            })
                    }
                    .font(.title)
                    
                    HStack() {
                        Button("Koncerty", action: {
                            a = concertEvents.filter()
                        })
                        
                        Button("Spektakle", action: {
                            a = theatreEvents.filter()
                        })
                        
                        Button("Wszystko", action: {
                            a = ShowAll(events: EventList.someEvents).filter()
                        })
                    }.font(.system(size: 22))
                    
                    Divider()
                    
                    VStack{
                        NavigationLink(
                            destination: MyTicketsView(),
                            label: {
                                Text("Moje Bilety")
                            })
                    }.font(.system(size: 22))
                    
                    Divider()
                    
                    NavigationLink(
                        destination: BasketView(),
                        label: {
                            VStack {
                                Text("Przejedź do koszyka")
                                    .font(.system(size: 25))
                            }.padding(.top, 25)
                            
                        })
                    
                }
                .onAppear {
                    UITableView.appearance().backgroundColor = UIColor.clear
                    UITableViewCell.appearance().backgroundColor = UIColor.clear
                }
                .navigationBarTitle("Dostępne bilety")
                
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
