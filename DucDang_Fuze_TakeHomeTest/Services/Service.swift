//
//  Service.swift
//  DucDang_Fuze_TakeHomeTest
//
//  Created by duc on 2021-10-24.
//

import SwiftUI
import Combine

class KeyboardDismissal {
    static func dismissKeyboardOnScroll(scrollView: UIScrollView?) {
        scrollView?.keyboardDismissMode = .onDrag
    }
    
    static func dismissKeyboardFunction() {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
        .map({$0 as? UIWindowScene})
        .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        
        keyWindow?.endEditing(true)
    }
}
