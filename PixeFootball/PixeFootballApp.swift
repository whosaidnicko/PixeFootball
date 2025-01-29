//
//  PixeFootballApp.swift
//  PixeFootball
//
//  Created by Nicolae Chivriga on 27/01/2025.
//

import SwiftUI

@main
struct PixeFootballApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            NavigationView {
                Startefutbiks()
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
