//
//  FinTrackApp.swift
//  FinTrack
//
//  Created by Tanmay Avinash Dabhade on 8/6/24.
//

import SwiftUI

@main
struct FinTrackApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    //Marking it with the StateObject property wrapper so that it follows the lifecycle of the app.
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
