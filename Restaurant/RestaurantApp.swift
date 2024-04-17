//
//  RestaurantApp.swift
//  Restaurant
//
//  Created by MAC on 3/3/24.
//

import SwiftUI

@main
struct RestaurantApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("loaded")
                }
        }
    }
}
