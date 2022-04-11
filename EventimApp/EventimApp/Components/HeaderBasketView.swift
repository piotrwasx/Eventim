//
//  HeaderBasketView.swift
//  EventimApp
//
//  Created by Piotr Waś on 11/04/2022.
//

import SwiftUI

struct HeaderBasketView: View {
    var body: some View {
        
        VStack {
            VStack{
                Text("Koszyk")
                    .font(.system(size: 48, weight: .medium, design: .default))
                    .fontWeight(.bold)
                    .bold()
                    .padding(.top, -20)
            }
        }
    }
}

struct HeaderBasketView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderBasketView()
    }
}
