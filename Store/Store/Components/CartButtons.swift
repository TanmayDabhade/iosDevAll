//
//  CartButtons.swift
//  Store
//
//  Created by Tanmay Avinash Dabhade on 7/17/24.
//

import SwiftUI

struct CartButtons: View {
    var numberOfProducts: Int
    var body: some View {
        ZStack(alignment: .topTrailing, content: {
            Image(systemName: "cart")
                .resizable()
                
                .frame(width: 30, height: 30)
            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    .font(.caption2).bold()
                    .frame(width: 15, height: 15)
                    .foregroundStyle(Color.white)
                    .background(Color.red)
                    .clipShape(Circle())
            }
        })
    }
}

#Preview {
    CartButtons(numberOfProducts: 1)
        .environmentObject(CartManager())
}
