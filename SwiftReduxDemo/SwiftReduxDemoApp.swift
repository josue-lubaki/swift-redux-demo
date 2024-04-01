//
//  SwiftReduxDemoApp.swift
//  SwiftReduxDemo
//
//  Created by Josue Lubaki on 2024-04-01.
//

import SwiftUI

@main
struct SwiftReduxDemoApp: App {
    
    let store = Store(reducer: reducer)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
