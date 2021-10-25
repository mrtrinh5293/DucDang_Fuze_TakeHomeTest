//
//  CustomTextField.swift
//  DucDang_Fuze_TakeHomeTest
//
//  Created by duc on 2021-10-24.
//

import SwiftUI

struct CustomTextField: View {
    
    /// Text inputted by the user
    @Binding var text: String
    
    /// Flag which by default protects user input for being viewed.  User can optionally disable.
    var isSecureField: Bool
    
    /// Text which is displayed when TextField is empty
    var placeHolder: String
    
    // P: Handles text content visability
    @State private var isTextVisable = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 1) {
            HStack {
                if !isSecureField || isTextVisable {
                    TextField("", text: $text)
                    .autocapitalization(.none)
                } else {
                    SecureField("", text: $text)
                    .autocapitalization(.none)
                }

                if isSecureField {
                    Button(action: {
                        isTextVisable.toggle()
                    }) {
                        Image(systemName: isTextVisable ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(Color.twitterBlue)
                    }
                }
            }
            .background(
                Text(placeHolder)
                    .padding(.horizontal, placeHolder.isEmpty ? 0 : 8)
                    .background(Color.white)
                    .scaleEffect(text.isEmpty ? 1 : 0.7, anchor: .leading)
                    .offset(y: text.isEmpty ? 0 : -26)
                    .animation(.easeOut.speed(1.5))
                    .foregroundColor(.gray), alignment: .leading
            )
            .padding(.horizontal)
        }
        .frame(height: 55)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.twitterBlue, lineWidth: 1.8)
        )
    }
}
