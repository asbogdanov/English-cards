//
//  ContentView.swift
//  eng
//
//  Created by Aleksandr Bogdanov on 19.04.2023.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        VStack {
            TabBarView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
