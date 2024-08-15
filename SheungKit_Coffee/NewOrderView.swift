//
//  NewOrderView.swift
//  SheungKit_Coffee
//
//  Created by Simon Chan on 2024-06-11.
//

import SwiftUI

struct NewOrderView: View {
    
    @ObservedObject var dataSource : OrderDataSource = OrderDataSource()
    
    var coffeeTypes = ["Dark Roast", "Original Blend", "Vanilla"]
    var coffeeSizes = ["Small", "Medium", "Large"]
    
    @State private var coffeeType: String = "Dark Roast"
    @State private var coffeeSize: String = "Small"
    @State private var quantity: Int = 1
    @State private var userName: String = ""
    @State private var isCompleted: Bool = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text("New Order")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        Form {
            Section(header: Text("Order Info")){
                Picker("Select a Coffee Type", selection: self.$coffeeType){
                    ForEach(self.coffeeTypes, id: \.self){
                        Text($0)
                    }
                }
                .pickerStyle(.menu)
                Picker("Select a Size", selection: self.$coffeeSize){
                    ForEach(self.coffeeSizes, id: \.self){
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                Stepper(value: $quantity, in: 1...10){
                    Text("Quantity of Coffee: \(quantity)")
                }
            } //Section_order
            .font(.headline)
            
            Section(header: Text("User Info")){
                TextField("Enter your name", text: self.$userName)
                    .keyboardType(.default)
            } //Section_user
            .font(.headline)
            
            Toggle("Completed", isOn: $isCompleted)
            
        } //Form
        Button(action: {
            let newOrder = Order(userName: userName, coffeeType: coffeeType, coffeeSize: coffeeSize, quantity: quantity, isCompleted: isCompleted)
            dataSource.orderList.append(newOrder)
            dataSource.saveOrder()
            dismiss()
        }){
            Text("Add Order")
        }
        .padding()
        .foregroundColor(.white)
        .bold()
        .background(.blue)
        .cornerRadius(100)
        .padding(.bottom, 50)
    }
}

#Preview {
    NewOrderView()
}
