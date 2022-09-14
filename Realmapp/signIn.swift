//
//  signIn.swift
//  Realmapp
//
//  Created by Gerald Dempsey on 15/09/2022.
//

import SwiftUI
import Firebase

struct signIn: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var animationAmount:Double = 0.9
    @State private var isShowingSignUpView:Bool = false
    @State private var opacityButton: Double = 1
    @State private var opacityButton2: Double = 0
    @State private var rise: Double = 30
    @State private var showingAlert:Bool = false
    @State private var errorText:String = ""
    @State private var dta:Bool = false
    @State private var userIsLoggedIn = false
    @State private var moveToSignUp = false
    var body: some View {
       signIn
    }
    var signIn: some View {
        
        ZStack {
            Color.black
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundColor(dta ? .blue : .red)
                .frame(width: 1000, height: 460)
                .rotationEffect(.degrees(45)).animation(.easeInOut(duration: 2), value: dta)
            HStack {
                ZStack {
                    Text("Sign Up").bold().font(.largeTitle).foregroundColor(.white).offset(x:-90, y:-250).opacity(opacityButton)
                        .animation(.easeInOut(duration: 1), value: opacityButton)
                    Text("Sign In").bold().font(.largeTitle).foregroundColor(.white).offset(x:-90, y:-250).opacity(opacityButton2)
                        .animation(.easeInOut(duration: 2), value: opacityButton2)
                }
                
                
            }
            VStack(spacing:20) {
                
                TextField("Email", text: $email)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .accentColor(.white)
                    .autocapitalization(.none)
                    .placeholder(when: email.isEmpty) {
                        Text("Email")
                            .foregroundColor(.white)
                            .bold().offset(x:3)
                    }
                Rectangle().frame(width: 350, height: 1).foregroundColor(.white)
                SecureField("Password", text:$password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .accentColor(.white)
                    .placeholder(when: password.isEmpty) {
                        Text(
                            "Password")
                        .foregroundColor(.white)
                        .bold().offset(x:3)
                    }
                Rectangle().frame(width: 350, height: 1).foregroundColor(.white)
                
                
                ZStack {
                    ZStack {
                        SecureField("Confirm Password", text:$confirmPassword)
                            .foregroundColor(.white)
                            .textFieldStyle(.plain)
                            .accentColor(.gray)
                            .placeholder(when: confirmPassword.isEmpty) {
                                Text(
                                    "Confirm Password")
                                .foregroundColor(.white)
                                .bold().offset(x:3)
                            }
                        Rectangle().frame(width: 350, height: 1).foregroundColor(.white).offset(y:30)
                        
                    }.offset(y:-20).opacity(opacityButton).animation(.easeInOut(duration: 1), value: opacityButton)
                    NavigationLink(destination: Home(), isActive: $userIsLoggedIn) {
                        
                    }
                    Button{
                        sin()
                    } label: {
                        Text("Sign In")
                            .bold()
                            .frame(width: 200, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .foregroundColor(.black)
                            ).foregroundColor(.white)
                    }.offset(y:100).padding(.top)
                    Button{
                        
                    } label: {
                        Text("Sign Up")
                            .bold()
                            .frame(width: 200, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .foregroundColor(.black)
                            ).foregroundColor(.white)
                    }.opacity(opacityButton)
                        .animation(.easeInOut(duration: 1), value: opacityButton).offset(y:100).padding(.top)
                }
                
                NavigationLink(destination: signUp(), isActive: $moveToSignUp) {}
                VStack {
                    ZStack {
                        
                        
                        Button {
                            moveToSignUp = true
                        } label: {
                            Text("Don't have an account yet.")
                                .bold().foregroundColor(.white).offset(y:rise).opacity(opacityButton2).animation(.easeInOut(duration: 1), value: [opacityButton, rise])
                        }
                        Text("Already have an account.")
                            .bold().foregroundColor(.white).opacity(opacityButton).animation(.easeInOut(duration: 1), value: opacityButton)
                    }
                }.padding(.top).offset(y:100)
                
            }
            .frame(width:350)
            
            
            showingAlert ?
            ZStack {
                Rectangle().frame(width: 1000, height: 80).foregroundColor(.black).opacity(1)
                Text(errorText).foregroundColor(.red).opacity(1).bold().font(.headline).offset(y:-10)
                
            }.offset(y:400) : ZStack {
                Rectangle().frame(width: 1000, height: 80).foregroundColor(.white).opacity(0)
                Text("").foregroundColor(.black).opacity(0).bold().font(.title).offset(y:-10)
            }.offset(y:400)
        }.ignoresSafeArea().navigationBarBackButtonHidden(true)
            .onAppear(){
                if Auth.auth().currentUser != nil {
                    userIsLoggedIn.toggle()
                }
            
                rise = 0
                opacityButton = 0
                opacityButton2 = 1
                dta = true
                
                
            }
        
        
    }
  
    
        func openSignUpPage() {
            animationAmount += 180
            isShowingSignUpView = true
        }

    func sin() {
        if(email == "") {
            errorText = "Please enter your email."
            showingAlert = true
        }
        else {
            if(password == "") {
                errorText = "Please enter your password."
                showingAlert = true
            }
            else {
                errorText = ""
                showingAlert = false
                Auth.auth().signIn(withEmail: email, password: password) {
                        result, error in if error != nil {
                        print(error!.localizedDescription)
                        }else {
                            userIsLoggedIn.toggle()
                        }
                   
                }
                
            }
        }
    }
    
}


struct signIn_Previews: PreviewProvider {
    static var previews: some View {
        signIn()
    }
}
