//
//  TicketRow.swift
//  EventimApp
//
//  Created by Piotr Waś on 09/05/2022.
//

import SwiftUI

struct TicketRow: View {
    var ticket: String
    var typeOfEvent: String
    
    var body: some View {
        
        HStack(spacing: 40){
            if typeOfEvent == "Koncert"{
                Image("concert")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60 ,alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            else if typeOfEvent == "Spektakl"{
                Image("theatre")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            else {
                Image("none")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            
            
            Text(ticket)
                .padding(.all, 10)
        }
        
    }
}

struct TicketRow_Previews: PreviewProvider {
    static var previews: some View {
        TicketRow(ticket: "Blabla", typeOfEvent: "Koncert")
    }
}
