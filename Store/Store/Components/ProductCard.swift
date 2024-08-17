//
//  ProductCard.swift
//  Store
//
//  Created by Tanmay Avinash Dabhade on 7/17/24.
//

import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            
            
            
            ZStack(alignment: .bottom){
                Image(product.image)
                    .resizable()
                    .cornerRadius(20)
                    .aspectRatio(contentMode: .fill)
                    .scaledToFit()
                    .frame(width: 180, height: 270)
                
                VStack(alignment: .leading){
                    Text(product.name)
                        .font(.title3)
                        .bold()
                        
                        
                    Text("$\(product.price)")
                        .font(.caption).bold()

                        
                    
                }
                .padding()
                .frame(width: 180, alignment: .leading)
                .colorInvert()
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                
                
            }
            .shadow(radius: 3)
            .frame(width: 180)
//            .background(Color.red)
            
            Button(action: {
                cartManager.addToCart(product: product)
            }, label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.black)
                    .colorInvert()
            })
            .padding()
            
            
        }
        
    }
}

#Preview {
    ProductCard(product: productList[2])
        .environmentObject(CartManager())
}
