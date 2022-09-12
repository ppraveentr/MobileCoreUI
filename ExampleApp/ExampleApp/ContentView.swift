//
//  ContentView.swift
//  ExampleApp
//
//  Created by Praveen Prabhakar on 03/09/22.
//

import SwiftUI
import Theme

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Empty!")
                .setThemeStyle("")
            Text("Hello, world!")
                .padding()
                .setThemeStyle("sd")
//                .background(.yellow, in: Rectangle())
        }
        .foregroundColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
