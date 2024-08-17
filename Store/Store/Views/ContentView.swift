//
//  ContentView.swift
//  Store
//
//  Created by Tanmay Avinash Dabhade on 7/17/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(productList, id: \.id) {
                        product in 
                        ProductCard(product: product)
                            .environmentObject(cartManager)
                    }
                }
                .padding()
                
            }
            .navigationTitle("WatchIt")
            .toolbar{
                    NavigationLink {
                        CartView()
                    } label: {
                        CartButtons(numberOfProducts: cartManager.products.count)

                    }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
            .environmentObject(CartManager())
    }
    
}
