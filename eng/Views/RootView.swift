//
//  ContentView.swift
//  eng
//
//  Created by Aleksandr Bogdanov on 19.04.2023.
//

import SwiftUI

struct RootView: View {

    @ObservedObject var listViewModel = ListViewModel()

    var body: some View {
        ZStack {
            TabView {
                RandomWordView()
                    .tag(1)
                    .tabItem {
                        Image(systemName: "house")
                    }
                ListView()
                    .environmentObject(listViewModel)
                    .tag(2)
                    .tabItem {
                        Image(systemName: "list.bullet.clipboard")
                    }
            }
            if listViewModel.isShowAddView {
                NewWordView()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
