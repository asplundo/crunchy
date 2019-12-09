//
// Created by me
  

import SwiftUI

struct RoundedButtonStyle: ViewModifier {

    func body(content: Content) -> some View {
        return content
        .font(.headline)
        .padding()
        .background(Color.blue)
        .cornerRadius(20)
        .foregroundColor(.white)
    }
}

extension View {
    func rounded() -> some View {
        self.modifier(RoundedButtonStyle())
    }
}
