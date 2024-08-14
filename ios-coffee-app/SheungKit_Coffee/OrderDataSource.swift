//
//  OrderDataSource.swift
//  SheungKit_Coffee
//
//  Created by Simon Chan on 2024-06-11.
//

import Foundation

class OrderDataSource: ObservableObject {
    
    @Published var orderList : [Order] = []
    
    init(){
        loadOrder()
    }
    
    func loadOrder(){
        if let data = UserDefaults.standard.data(forKey: "order"),
           let savedOrders = try? JSONDecoder().decode([Order].self, from: data) {
            self.orderList = savedOrders
        }
    }

    func saveOrder(){
        if let encoded = try? JSONEncoder().encode(orderList) {
            UserDefaults.standard.set(encoded, forKey: "order")
        }
    } 
}
