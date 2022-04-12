//
//  BasketView.swift
//  EventimApp
//
//  Created by Piotr Waś on 22/03/2022.
//

import SwiftUI

struct BasketView: View {

    var body: some View {
        HeaderBasketView()
            .frame(height: 50)
            .padding(.top, -20)
        ScrollView {
            VStack {
                Text("\(BasketSingleton.basket.showBasket())")
                    .font(.system(size: 18, weight: .medium, design: .default))
                    .foregroundColor(.black)
                    .frame(width: 370)
                
                Spacer()
            }
        }
        
        Text("Suma: \(String(format: "%.2f",BasketSingleton.basket.countPrice())) zł")
            .font(.system(size: 18, weight: .medium, design: .default))
            .foregroundColor(.black)
            
        Spacer()
        
        Button("Kup", action: {
            let tA = MyTickets.TicketsArray
            let facade = Facade(myTickets: tA)
            
            facade.Procedure()
            
        }).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        
        Button("Opróżnij koszyk", action: {
            BasketSingleton.basket.clearBasket()
        }).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
    }
}
