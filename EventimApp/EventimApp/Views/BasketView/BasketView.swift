//
//  BasketView.swift
//  EventimApp
//
//  Created by Piotr Waś on 22/03/2022.
//

import SwiftUI

struct BasketView: View {

    @StateObject var basket = BasketSingleton.basket
    @StateObject private var viewModel = BasketViewModel()
    
    var body: some View {
        HeaderBasketView()
            .frame(height: 50)
            .padding(.top, -20)
        
        List {
            ForEach(basket.returnAll()) {
                item in
                    TicketRow(ticket: item.name, typeOfEvent: item.type)
            }
        }
        .onAppear {
            UITableView.appearance().backgroundColor = UIColor.clear
        }
        
        
        Text("Suma: \(String(format: "%.2f",basket.countPrice())) zł")
            .font(.system(size: 18, weight: .medium, design: .default))
            .foregroundColor(.black)
            
        Spacer()
        
        Button("Kup", action: {
            viewModel.buy()
        }).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        
        Button("Opróżnij koszyk", action: {
            viewModel.clearBasket(basket: basket)
        }).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
            .environmentObject(BasketSingleton.basket)
    }
}
