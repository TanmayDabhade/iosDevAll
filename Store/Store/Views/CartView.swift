//
//  CartView.swift
//  Store
//
//  Created by Tanmay Avinash Dabhade on 7/17/24.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        VStack{
            
                if cartManager.products.count > 0{
                    ScrollView{
                        ForEach(cartManager.products, id :\.id) {
                            product in
                            ProductRow(product: product)
                        }
                    }
                    .padding()
                    
                    
                }else{
                    Text("Your Cart is Empty")
                }
            
            Spacer()
            HStack{
                Text("Your Total is")
                Spacer()
                Text("$\(cartManager.total)")
                    .bold()
            }
            .padding()
            
            PaymentButton(action: {})
                .padding()
            
            
        }
        .navigationTitle("Your Cart")
        
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}
