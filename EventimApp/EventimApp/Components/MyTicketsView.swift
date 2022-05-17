//
//  MyTicketsView.swift
//  EventimApp
//
//  Created by Piotr Waś on 12/04/2022.
//

import SwiftUI

struct MyTicketsView: View {
    @StateObject var realmManager = RealmManager()
    var body: some View {
        
            VStack {
                List {
                    ForEach(realmManager.tickets) {
                        item in
                        if !item.isInvalidated {
                            TicketRow(ticket: item.name, typeOfEvent: item.type)
                                .onTapGesture {
                                    realmManager.deleteTicket(id: item.id)
                                }
                        }
                    }
                }
                .onAppear {
                    UITableView.appearance().backgroundColor = UIColor.clear
                }
                
                Spacer()
            }.navigationTitle("Moje bilety")
        }
        
    }

struct MyTicketsView_Previews: PreviewProvider {
    static var previews: some View {
        MyTicketsView()
    }
}
