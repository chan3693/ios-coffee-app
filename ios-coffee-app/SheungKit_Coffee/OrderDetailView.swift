//
//  OrderDetailView.swift
//  SheungKit_Coffee
//
//  Created by Simon Chan on 2024-06-11.
//

import SwiftUI

struct OrderDetailView: View {
    
    @EnvironmentObject var dataSource : OrderDataSource
    
    @State var seletedOrder: Order
   
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            Text("Order Detail")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("User Name : \(seletedOrder.userName)")
            Text("Coffee Type : \(seletedOrder.coffeeType)")
            Text("Coffee Size : \(seletedOrder.coffeeSize)")
            Text("Quantity : \(seletedOrder.quantity)")
            Text("Order Price : $\(String(format: "%.2f", seletedOrder.orderPrice))")
            if (self.seletedOrder.isCompleted){
                Text("Completed")
                    .foregroundStyle(Color.green)
            } else{
                Text("Incomplete")
                    .foregroundStyle(Color.red)
            }
            Button{
                self.seletedOrder.isCompleted.toggle()
                
                if let selectedIndex = dataSource.orderList.firstIndex(where: {$0
                    .id == seletedOrder.id}){
                    dataSource.orderList[selectedIndex].isCompleted = seletedOrder.isCompleted
                    dataSource.saveOrder()
                    dismiss()
                }else{
                    print(#function, "No matching object found")
                }
            }label: {
                Text("Mark Completed")
            } //Button
            .buttonStyle(.borderedProminent)
            Spacer()
        } //VStack
    } //body
} //View

#Preview {
    OrderDetailView(seletedOrder: Order(userName: "NA", coffeeType: "NA", coffeeSize: "NA", quantity: 1, isCompleted: false))
}
