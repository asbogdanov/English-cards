////
////  TabBarView.swift
////  eng
////
////  Created by Aleksandr Bogdanov on 03.05.2023.
////
//
//import SwiftUI
//
//struct TabBarView: View {
//
//    @ObservedObject var listViewModel = ListViewModel()
//
//    var body: some View {
//        TabView {
//            RandomWordView()
//                .tag(1)
//                .tabItem {
//                    Image(systemName: "house")
//                }
//            ListView()
//                .environmentObject(listViewModel)
//                .tag(2)
//                .tabItem {
//                    Image(systemName: "list.bullet.clipboard")
//                }
//        }
//
//        if listViewModel.isShowAddView {
//            NewWordView()
//        }
//    }
//}
//
//struct TabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarView()
//    }
//}
