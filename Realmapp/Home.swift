//
//  Home.swift
//  Realmapp
//
//  Created by Gerald Dempsey on 16/09/2022.
//

import SwiftUI
import Firebase
struct Home: View {
    @State private var isActive:Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                VStack {
                    ZStack {
                        Button {
                            signOut()
                            isActive = true
                        } label: {
                            Image("doorexit").resizable().frame(width: 80, height: 80)
                        }.offset(x:-150,y:-338)
                        Text("Realm App").multilineTextAlignment(.center).offset(y:-340).foregroundColor(.white).font(.title2).bold()
                        Rectangle().frame(width: 1000, height: 0.5).foregroundColor(.gray).offset(y:-310)
                    }
                    
                    NavigationLink(destination: signIn(), isActive: $isActive) {
                        
                    }
                   
                    
                }.navigationBarBackButtonHidden(true)
                
            }.ignoresSafeArea()
        }.navigationBarBackButtonHidden(true)
    }
    func signOut() {
            do {
                try Auth.auth().signOut()
            } catch let signOutError as NSError {
                print("Error signing out: %@", signOutError)
            }
        }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


