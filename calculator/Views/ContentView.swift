//
//  ContentView.swift
//  calculator
//
//  Created by kishan rana ghosh on 15/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors:
                [.vopretor.opacity(0.3), .purple.opacity(0.4)]),
                startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            .edgesIgnoringSafeArea(.all)
            KeyView()
        }
    }
}

#Preview {
    ContentView()
}
