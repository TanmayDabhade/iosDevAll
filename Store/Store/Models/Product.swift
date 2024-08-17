//
//  Product.swift
//  Store
//
//  Created by Tanmay Avinash Dabhade on 7/17/24.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
    
}

var productList = [Product(name: "Rolex Perpetual Date", image: "watch_1", price: 130),
                   Product(name: "Nixon", image: "watch_2", price: 150),
                   Product(name: "Mamba", image: "watch_3", price: 160),
                   Product(name: "Seiko", image: "watch_4", price: 120),
                   Product(name: "Seiko Light", image: "watch_5", price: 110),
                   Product(name: "Rolex Oyster Perpetual", image: "watch_6", price: 210),
                   Product(name: "Hamilton", image: "watch_7", price: 120),
                   Product(name: "Breitling Navitimer", image: "watch_8", price: 180)]
