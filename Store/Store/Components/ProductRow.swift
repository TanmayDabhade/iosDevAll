//
//  ProductRow.swift
//  Store
//
//  Created by Tanmay Avinash Dabhade on 7/17/24.
//

import SwiftUI

struct ProductRow: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    
    var body: some View {
        HStack(spacing: 20){
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)
            
            VStack(alignment: .leading){
                Text("\(product.name)")
                    .bold()
                Text("\(product.price)")
            }
            
            Spacer()
            
            
                Image(systemName: "trash")
                    .foregroundColor(.red)
                    .onTapGesture {
                        cartManager.removeFromCart(product: product)
                    }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ProductRow(product: productList[3])
        .environmentObject(CartManager())
}
