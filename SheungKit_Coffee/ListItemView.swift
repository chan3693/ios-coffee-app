//
//  ListItemView.swift
//  SheungKit_Coffee
//
//  Created by Simon Chan on 2024-06-11.
//

import SwiftUI

struct ListItemView: View {
    
    var order : Order
    @EnvironmentObject var dataSource : OrderDataSource
    
    var body: some View {
        NavigationLink{
            OrderDetailView(seletedOrder: order).environmentObject(self.dataSource)
        }label: {
            VStack(alignment: .leading, spacing: 15){
                Text("Coffee Type : \(order.coffeeType)")
                    .font(.headline)
                Text("Coffee Size : \(order.coffeeSize)")
                    .font(.headline)
            } //VStack
            .onTapGesture {
                print(#function, "list item selected : \(order.coffeeType) \(order.coffeeSize)")
            }
        }
    }
}


