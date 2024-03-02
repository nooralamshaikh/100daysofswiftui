//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Noor on 16/02/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingAlert = false
    
    var body: some View {
//        LinearGradient(colors: [.orange, .white, .green], startPoint: .top, endPoint: .center)
//        RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
//        AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
        VStack {
            Text("Gradient")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(.white)
                .background(.blue.gradient)
            Button("Show alert") {
                isShowingAlert.toggle()
            }
        }
        .alert("Some alert message", isPresented: $isShowingAlert) {
            Button("Delete", role: .destructive){}
            Button("Cancel", role: .cancel){}
            Button("Cancel"){}
            Button("Cancel"){}
            Button("Cancel"){}
            Button("Cancel"){}


        }
    }
}

#Preview {
    ContentView()
}
