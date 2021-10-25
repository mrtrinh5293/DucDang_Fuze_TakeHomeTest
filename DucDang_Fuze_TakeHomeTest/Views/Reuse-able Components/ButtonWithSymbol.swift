//
//  ButtonWithSymbol.swift
//  DucDang_Fuze_TakeHomeTest
//
//  Created by duc on 2021-10-24.
//

import SwiftUI

struct Reuseable_Button_Icon: View {
    
    var iconName: String
    var buttonAction: () -> Void
    
    var body: some View {
        Button(action: {
            buttonAction()
        }) {
            Image(systemName: iconName)
                .font(.title)
                .foregroundColor(Color.twitterBlue)
                .padding()
        }
        .mask(Circle()
                .frame(width: 200, height: 200))
        .shadow(radius: 5)
    }
}
