//
//  RealmappApp.swift
//  Realmapp
//
//  Created by Gerald Dempsey on 14/09/2022.
//


import SwiftUI
import Firebase
@main
struct RealmappApp: App {
   
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
           
        }
    }
}
