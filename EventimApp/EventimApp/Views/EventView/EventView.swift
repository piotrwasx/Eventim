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
    @StateObject private var basket = BasketSingleton.basket
    @StateObject private var viewModel = EventViewModel()
    
    var body: some View {
        VStack {
            ZStack{
                Image(viewModel.defImage(e: event))
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                if viewModel.checkIfAnyInBasket(basket: basket, event: event) == true {
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
            
            Button("Dodaj do koszyka", action: {
                viewModel.addToBasket(basket: basket, event: event)
            }).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }
    }
    
        
    struct TicketView_Previews: PreviewProvider {
        static var previews: some View {
            EventView(event: EventList.someEvents[3])
                .environmentObject(BasketSingleton.basket)
        }
    }
}
