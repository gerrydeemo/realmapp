//
//  ContentView.swift
//  Realmapp
//
//  Created by Gerald Dempsey on 14/09/2022.
//

import SwiftUI
import Firebase


struct ContentView: View {
    init(){
        UINavigationBar.setAnimationsEnabled(false)
    
    }
    var body: some View {
        NavigationView() {
           signIn()
        }
    }
        
}
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

