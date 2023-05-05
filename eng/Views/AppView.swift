////
////  AppView.swift
////  eng
////
////  Created by Aleksandr Bogdanov on 19.04.2023.
////
//
//import SwiftUI
//
//struct AppView: View {
//    @State private var words = ["Word - Слово", "Table - Стол", "Eat - Есть"]
//
//    
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                List {
//                    ForEach(words, id: \.self) { words in
//                        Text(words)
//                    }
//                    .onDelete(perform: delete)
//                    .onMove(perform: move)
//                }
//                .navigationBarItems(trailing: EditButton())
//            }
//            .navigationBarTitle("My dictionary", displayMode: .inline)
//        }
//
//    }
////MARK: - функция удаления слов из словаря
//    func delete(at offsets: IndexSet) {
//        words.remove(atOffsets: offsets)
//    }
////MARK: - функция перемещения слов в словаре
//    func move(from source: IndexSet, to destination: Int) {
//        words.move(fromOffsets: source, toOffset: destination)
//    }
//}
//
//struct AppView_Previews: PreviewProvider {
//    static var previews: some View {
//        AppView()
//    }
//}
//
//
