//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Noor on 16/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.orange
                Color.green
            }
            Text("India")
                .padding(50)
                .foregroundColor(.secondary)
                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
