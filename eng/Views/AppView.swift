//
//  AppView.swift
//  eng
//
//  Created by Aleksandr Bogdanov on 19.04.2023.
//

import SwiftUI

struct AppView: View {
    @State var selectedIndex = 0

    let icons = [
        "house",
        "list.bullet.clipboard",
//        "person"
    ]

    var body: some View {
        VStack(spacing: 0) {
            //Content
            ZStack {
                switch selectedIndex {
                case 0:
                    NavigationView {
                        VStack {
                            Text("First screen")
                        }
                        .navigationTitle("Home")
                    }
                case 1:
                    NavigationView {
                        VStack {
                            Text("First screen")
                        }
                        .navigationTitle("To study")
                    }
//                case 2:
//                    NavigationView {
//                        VStack {
//                            Text("First screen")
//                        }
//                        .navigationTitle("Profile")
//                    }
                default:
                    NavigationView {
                        VStack {
                            Text("Second screen")
                        }
                        .navigationTitle("Second")
                    }
                }
            }

            Spacer()

            Divider()
                .padding(.bottom, 20)
            HStack{
                ForEach(0..<2, id: \.self) { number in
                    Spacer()
                    Button(action: {
                        self.selectedIndex = number
                    }, label: {
                        Image(systemName: icons[number])
                            .font(.system(
                                size: 25,
                                weight: .regular,
                                design: .default))
                            .foregroundColor(selectedIndex == number ? Color(.label) : Color(UIColor.lightGray))
                    })
                    Spacer()
                }
            }
        }
    }
}



struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}


