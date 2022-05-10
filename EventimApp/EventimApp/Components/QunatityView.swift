//
//  QunatityView.swift
//  EventimApp
//
//  Created by Piotr Waś on 10/05/2022.
//

import SwiftUI


struct QunatityView: View {
    
    var event: String
    @StateObject var basket: BasketSingleton
    
    var body: some View {
        let count = BasketSingleton.basket.makeIterator().countTickets(s: event)
        
        ZStack{
            Circle()
                .fill(Color.red)
                .frame(width: 60, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
            Text("\(count)")
                .foregroundColor(.white)
                .font(.system(size: 20))
        }
    }
}

struct QunatityView_Previews: PreviewProvider {
    static var previews: some View {
        QunatityView(event: "Rihanna", basket: BasketSingleton.basket)
            .environmentObject(BasketSingleton.basket)
    }
}
