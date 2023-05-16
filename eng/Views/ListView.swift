//
//  ListView.swift
//  eng
//
//  Created by Aleksandr Bogdanov on 05.05.2023.
//

import SwiftUI
import RealmSwift

struct ListView: View {

    @State private var searchText = ""
    @EnvironmentObject var listViewModel: ListViewModel
    //добавлен сам массив данных из Realm + сортировка по алфавиту
    @ObservedResults(WordItem.self, sortDescriptor: SortDescriptor(keyPath: "mainWord", ascending: true)) var wordItem
    
    var body: some View {
        VStack {
            VStack {
                Text("Ваш словарь")
                    .font(.system(size: 20, weight: .black))

                //Поиск
                HStack(spacing: 8) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(maxWidth: 15, maxHeight: 15)
                        .foregroundColor(.gray)

                    TextField("Поиск", text: $searchText)
                }
                .padding(8)
                .padding(.horizontal, 20)
                .background(Color(.systemGray5))
                .searchable(text: $searchText, collection: $wordItem, keyPath: \.mainWord)
            }

            Divider()

            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
                ScrollView(.vertical, showsIndicators: false) {

                    ForEach(wordItem, id: \.id) { item in
                        VStack {
                            CardItem(carditem: item) {
                                withAnimation {
                                    $wordItem.remove(item)
                                }
                            }
                        }
                        .padding(.vertical, 15)
                        .padding(.horizontal, 20)
                    }
                    .frame(maxWidth: .infinity)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Button {
                    listViewModel.isShowAddView.toggle()
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: 56, height: 56)
                            .foregroundColor(Color.blue)

                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                    .offset(x: -20, y: -30)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}


struct CardItem: View {

    @State var offsetX: CGFloat = 0
    var carditem: WordItem
    
    var onDelete: ()->()
    
    var body: some View {
        ZStack(alignment: .trailing) {
            removeImage()
            
            VStack(alignment: .leading, spacing: 20) {
                Text(carditem.mainWord)
                    .font(.system(size: 20, weight: .bold))
                
                Divider()
                
                Text(carditem.translateWord)
                    .font(.system(size: 20))
            }
            .padding(30)
            .background(
                Rectangle()
                    .fill(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .black, radius: 7))
            .offset(x: offsetX)
            .gesture(DragGesture()
                .onChanged{ value in
                    if value.translation.width < 0 {
                        offsetX = value.translation.width
                    }
                }
                .onEnded { value in
                    withAnimation {
                        if screenSize().width * 0.7 < -value.translation.width {

                            //При удалении карточки срабатывает виброотклик(таптикенджин)
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()

                            withAnimation {
                                offsetX = -screenSize().width
                                onDelete()
                            }
                        } else {
                            offsetX = .zero
                        }
                    }
                }
            )}
    }
    
    @ViewBuilder
    func removeImage() -> some View {
        Image(systemName: "xmark")
            .resizable()
            .frame(width: 10, height: 10)
            .offset(x: 30)
            .offset(x: offsetX * 0.5)
            .scaleEffect(CGSize(width: 0.1 * -offsetX * 0.08,
                                height: 0.1 * -offsetX * 0.08))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

//Расширение для определения размера экрана любого размера
extension View {
    func screenSize() -> CGSize {
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene
        else {
            return .zero
        }
        return window.screen.bounds.size
    }
}

