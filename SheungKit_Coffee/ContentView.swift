//
//  ContentView.swift
//  SheungKit_Coffee
//
//  Created by Simon Chan on 2024-06-11.
//

import SwiftUI



struct ContentView: View {
    
    @StateObject var dataSource : OrderDataSource = OrderDataSource()
    
    var body: some View {
        NavigationStack{
            VStack {
                List {
                    ForEach(dataSource.orderList.filter { !$0.isCompleted}){ order in
                        ListItemView(order: order).environmentObject(self.dataSource)
                    }
                    .onDelete(perform: { indexSet in
                        print(#function, "indexSet: \(indexSet)")
                        self.dataSource.orderList.remove(atOffsets: indexSet)
                        dataSource.saveOrder()
                    })
                }
            } //VStack
            .padding()
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    NavigationLink(destination: NewOrderView(dataSource: dataSource)){
                        Image(systemName: "plus")
                            .foregroundColor(Color.blue)
                    }
                }
            }
            .navigationTitle(Text("Sheung Kit Chan"))
            .navigationBarTitleDisplayMode(.inline)
            .onAppear{
                dataSource.loadOrder()
            }
        } //NavigationStack
    }
} //ContentView

//#Preview {
//    ContentView()
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
