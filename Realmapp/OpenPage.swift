//
//  OpenPage.swift
//  Realmapp
//
//  Created by Gerald Dempsey on 16/09/2022.
//

import SwiftUI

struct OpenPage: View {
    @State private var rotateAnim:Double = 0

    var body: some View {
      
            ZStack {
                Color.black.ignoresSafeArea()
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .foregroundColor(.red)
                    .frame(width: 1000, height: 477) .rotationEffect(.degrees(45))
                   
                NavigationLink(destination: signIn()) {
                   
                        Text("Continue")
                            .bold()
                            .frame(width: 200, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .foregroundColor(.black)
                            ).foregroundColor(.white)
                    
                }.offset(y:120).padding(.top)
                    .onAppear() {
                        rotateAnim = 180
                        
                    }
           
                
            
        }
    }
        
    
}

struct OpenPage_Previews: PreviewProvider {
    static var previews: some View {
        OpenPage()
    }
}
