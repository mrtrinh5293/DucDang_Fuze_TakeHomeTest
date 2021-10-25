//
//  LoginView.swift
//  DucDang_Fuze_TakeHomeTest
//
//  Created by duc on 2021-10-24.
//

import SwiftUI

struct LoginView: View {

    @State var attempts: Int = 0
    @State var password = "password"
    @State var username = "username"
    
    @Binding var usernames: [String]
    @Binding var passwords: [String]
    @Binding var isAuthenticated : Bool
    
    var body: some View {
        
        VStack {
            VStack {
                Image("LaunchScreen").resizable().aspectRatio(contentMode: .fit)
                
                Text("Log in to your account")
                    .font(Font.custom("Montserrat-Bold", size: 35.0))
                    .fontWeight(.bold)
                    .foregroundColor(Color.twitterBlue)
                    .padding(.bottom, 20)
                
                VStack(alignment: .leading, spacing: 20) {
                    CustomTextField(text: $username, isSecureField: false, placeHolder: "Username")
                    CustomTextField(text: $password, isSecureField: true, placeHolder: "Password")
                    
                    ZStack {
                        if self.attempts > 0 {
                            Text("*Please check your email and password")
                                .foregroundColor(.red)
                                .font(.system(size: 15))
                        }
                    }
                }
                .padding(.bottom, 15)
                .animation(.easeOut(duration: 0.3))
                .animation(.easeOut.speed(1.5))
                
                Button(action: {
                    if passwords.contains(password) &&  usernames.contains(username){
                        isAuthenticated = true
                    } else {
                        isAuthenticated = false
                        withAnimation(.default) {
                            self.attempts += 1
                        }
                    }
                    print(isAuthenticated)
                }, label: {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - (UIScreen.main.bounds.width / 5))
                        .padding()
                })
                    .background(Color.twitterBlue)
                    .cornerRadius(10)
                    .padding(.top, 45)
                    .modifier(Shake(animatableData: CGFloat(attempts)))
                
            } .padding(.horizontal, 15)
        }
        .animation(.spring())
    }
}

struct Shake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
            amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
            y: 0))
    }
}
