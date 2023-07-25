//
//  SwiftUIView.swift
//  SwiftUIDemo_Recipe
//
//  Created by DaKing on 2023/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAdvancedOptions = false
    @State private var enableLogging = false

    var body: some View {
        Form {
            Section {
                Toggle("Show advanced options", isOn: $showingAdvancedOptions.animation())

                if showingAdvancedOptions {
                    Toggle("Enable logging", isOn: $enableLogging)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
