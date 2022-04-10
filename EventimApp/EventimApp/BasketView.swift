//
//  BasketView.swift
//  EventimApp
//
//  Created by Piotr Waś on 22/03/2022.
//

import SwiftUI

struct BasketView: View {

    var body: some View {
        ScrollView {
            VStack {
                Text("Koszyk")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding(.top, -20)
                
                Text("\(BasketSingleton.basket.showBasket())")
                    .font(.system(size: 15, weight: .medium, design: .default))
                    .foregroundColor(.black)
                
                Spacer()
                
                Button("Oproznij koszyk", action: {
                    BasketSingleton.basket.clearBasket()
                }).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
            }
        }
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
    }
}
