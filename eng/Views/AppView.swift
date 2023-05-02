//
//  AppView.swift
//  eng
//
//  Created by Aleksandr Bogdanov on 19.04.2023.
//

import SwiftUI

struct AppView: View {
    @State var selectedIndex = 0
    @State private var words = ["Word - Слово", "Table - Стол", "Eat - Есть"]

    let icons = [
        "house",
        "list.bullet.clipboard"
    ]

    var body: some View {
        VStack(spacing: 0) {
            //Content

            ZStack {
                switch selectedIndex {
                case 0:
                    NavigationView {
                        VStack {
                            TextFieldView()
                            AddButtonView()
                                .padding(.top, 50)
                        }
                        .navigationBarTitle("Add new word", displayMode: .inline)
                    }
                    .padding(.top, 20)

                default:
                    NavigationView {
                        VStack {
                            List {
                                ForEach(words, id: \.self) { words in
                                    Text(words)
                                }
                                .onDelete(perform: delete)
                                .onMove(perform: move)
                            }
                            .navigationBarItems(trailing: EditButton())
                        }
                         .navigationBarTitle("My dictionary", displayMode: .inline)
                    }
                    .padding(.top, 20)
                }
            }

            Spacer()

            Divider()
                .padding(.bottom, 20)
            HStack {
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
//MARK: - функция удаления слов из словаря
    func delete(at offsets: IndexSet) {
        words.remove(atOffsets: offsets)
    }
//MARK: - функция перемещения слов в словаре
    func move(from source: IndexSet, to destination: Int) {
        words.move(fromOffsets: source, toOffset: destination)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}


