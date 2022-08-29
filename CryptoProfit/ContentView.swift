//
//  ContentView.swift
//  CryptoProfit
//
//  Created by Alexandr Rodionov on 28.08.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                Text("color1")
                    .foregroundColor(Color.theme.accent)
                Text("color2")
                    .foregroundColor(Color.theme.icon)
                Text("color3")
                    .foregroundColor(Color.theme.red)
                Text("color4")
                    .foregroundColor(Color.theme.green)
                Text("color5")
                    .foregroundColor(Color.theme.secondaryText)
            }
            .font(.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
