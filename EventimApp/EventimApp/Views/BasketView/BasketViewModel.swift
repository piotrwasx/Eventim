//
//  BasketViewModel.swift
//  EventimApp
//
//  Created by Piotr Waś on 17/05/2022.
//

import Foundation

final class BasketViewModel: ObservableObject {
    
    func buy() {
        let tA = MyTickets.TicketsArray
        let facade = Facade(myTickets: tA)
        facade.Procedure()
    }
    
    func clearBasket(basket: BasketSingleton) {
        basket.clearBasket()
    }
}
