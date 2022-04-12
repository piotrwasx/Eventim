//
//  MyTicketsView.swift
//  EventimApp
//
//  Created by Piotr Waś on 12/04/2022.
//

import SwiftUI

struct MyTicketsView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("\(MyTickets.myTickets.toString())")
                    .font(.system(size: 18, weight: .medium, design: .default))
                    .foregroundColor(.black)
                    .frame(width: 370)
                
                Spacer()
            }.navigationTitle("Moje bilety")
        }
        
    }
}

struct MyTicketsView_Previews: PreviewProvider {
    static var previews: some View {
        MyTicketsView()
    }
}
