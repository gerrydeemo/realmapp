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
                    
                        Rectangle().frame(width: 1000, height: 100).foregroundColor(.red).offset(y:-365)
                        Text("IDK Name").multilineTextAlignment(.center).offset(y:-340).foregroundColor(.white).font(.largeTitle).bold()
                    }
                    
                    NavigationLink(destination: signIn(), isActive: $isActive) {
                        
                    }
                    Button {
                        signOut()
                        isActive = true
                    } label: {
                        Text("logout").foregroundColor(.blue)
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
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}
