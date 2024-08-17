//
//  AppleTutorialApp.swift
//  AppleTutorial
//
//  Created by Tanmay Avinash Dabhade on 8/4/24.
//

import SwiftUI
import SwiftData

@main
struct AppleTutorialApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
