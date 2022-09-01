//
//  CircleButtonAnimationView.swift
//  CryptoProfit
//
//  Created by Alexandr Rodionov on 28.08.22.
//

// MARK: Анимация под левой кнопкой в виде кружка

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var animate: Bool
    
    var body: some View {
        withAnimation {
            Circle()
                .stroke(lineWidth: 5.0)
                .scale(animate ? 1.0 : 0.0)
                .opacity(animate ? 0.0 : 1.0)
        }
    }
}

struct CircleButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnimationView(animate: .constant(false))
            .foregroundColor(Color.theme.red)
            .frame(width: 100, height: 100)
    }
}
