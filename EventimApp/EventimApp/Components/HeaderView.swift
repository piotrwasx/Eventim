//
//  HeaderView.swift
//  EventimApp
//
//  Created by Piotr Waś on 10/04/2022.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .opacity(0.7)
            
            VStack {
                VStack{
                    Text("Eventim")
                        .font(.system(size: 64, weight: .medium, design: .default))
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    Text("Wannabe")
                        .font(.system(size: 15, weight: .medium, design: .default))
                        .foregroundColor(.white)
                        .padding(.top,-20)
                        .padding(.leading, -109)
                }
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
