//
//  firebaseApp.swift
//  Realmapp
//
//  Created by Gerald Dempsey on 16/09/2022.
//

import SwiftUI
import Firebase
@main
struct firebaseApp: App {
   
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
           
        }
    }
}

