//
//  ExpandingModal.swift
//  DucDang_Fuze_TakeHomeTest
//
//  Created by duc on 2021-10-24.
//

import SwiftUI

struct ExpandingModal<T: View>: View {
        
    @Binding var isActive: Bool
    
    var content: T?
    var expandType: ExpandType = .normal
    var color: Color = .white
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Rectangle()
                    .foregroundColor(isActive ? Color.gray.opacity(0.5) : Color.clear)
                    .onTapGesture(perform: {
                        self.isActive.toggle()
                        KeyboardDismissal.dismissKeyboardFunction()
                    }).opacity(isActive && expandType == .normal ? 1:0)
                    .animation(.easeInOut)
                
                ZStack {
                    if content != nil {
                        content
                            .transition(.opacity)
                    } else {
                        EmptyView()
                    }
                }
                .background(color)
                .cornerRadius(10)
                .scaleEffect(isActive ? 1:0)
                .animation(.easeInOut)
            }
            .shadow(radius: isActive && expandType == .noBackground ? 4:0)
            .opacity(isActive ? 1:0)
            .animation(.easeInOut)
            .position(x: geo.frame(in: .global).midX, y: geo.frame(in: .global).midY)
            .edgesIgnoringSafeArea(.all)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        
    }
}

enum ExpandType {
    case normal
    case noBackground
}
