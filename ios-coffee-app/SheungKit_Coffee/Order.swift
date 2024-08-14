//
//  Order.swift
//  SheungKit_Coffee
//
//  Created by Simon Chan on 2024-06-11.
//

import Foundation

class Order: Identifiable, Codable {
    var id: UUID = UUID()
    
    var userName: String
    var coffeeType: String
    var coffeeSize: String
    var quantity: Int
    var orderPrice: Double {
        let sizePrice: Double
        switch coffeeSize {
        case "Small":
            sizePrice = 1.97
        case "Medium":
            sizePrice = 2.97
        case "Large":
            sizePrice = 3.97
        default:
            sizePrice = 0.0
        }
        return sizePrice * Double(quantity)
    }
    var isCompleted: Bool
    
    init(userName: String, coffeeType: String, coffeeSize: String, quantity: Int, isCompleted: Bool) {
        self.userName = userName
        self.coffeeType = coffeeType
        self.coffeeSize = coffeeSize
        self.quantity = quantity
        self.isCompleted = isCompleted
    }
}
