//
//  RandomWordView.swift
//  eng
//
//  Created by Aleksandr Bogdanov on 05.05.2023.
//

import SwiftUI
import RealmSwift

struct RandomWordView: View {
    @State var isShowTranslate = false
    @ObservedResults(WordItem.self) var wordItem
    
    @State var word = WordItem()
    @State var offsetX: CGFloat = 0
    @State var opacity: CGFloat = 1
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            VStack {
                Spacer()
                
                VStack {
                    VStack(alignment: .leading, spacing: 20) {
                        Text(word.mainWord)
                            .font(.system(size: 36, weight: .bold))
                        Text(word.translateWord)
                            .font(.system(size: 30))
                            .opacity(isShowTranslate ? 1 : 0)
                    }
                    .opacity(opacity)
                    .offset(x: offsetX)
                    
                    ZStack {
                        Button(action: {
                            withAnimation {
                                isShowTranslate.toggle()
                            }
                        }) {
                            HStack {
                                Spacer()
                                
                                Text("Показать перевод")
                                    .frame(height: 55)
                                    .frame(maxWidth: .infinity)
                                
                                Spacer()
                            }
                            .font(.headline)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(color: .black, radius: 5)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(65)
                    }
                    .opacity(isShowTranslate ? 0 : 1)
                }

                Button(action: {
                    withAnimation {
                        offsetX = -50
                        opacity = 0
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                        getRandomWord()
                        offsetX = 30
                        isShowTranslate = false

                        withAnimation {
                            offsetX = 0
                            opacity = 1
                        }
                    }
                }) {
                    HStack {
                        Spacer(minLength: 30)
                        
                        Text("Следующее слово")
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                        
                        Image(systemName: "arrowshape.right.fill")
                        
                        Spacer(minLength: 40)
                    }
                    .font(.headline)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(color: .black, radius: 5)
                }
                .buttonStyle(PlainButtonStyle())
                .padding(65)
                .onAppear {
                    getRandomWord()
                }
            }
        }
    }

    func getRandomWord() {
        //проверка словаря на пустоту
        if wordItem.isEmpty {
            //ничего не делаем
        } else {
            let rand = Int.random(in: 0...wordItem.count - 1)
            self.word = wordItem[rand]
        }
    }
}

struct RandomWordView_Previews: PreviewProvider {
    static var previews: some View {
        RandomWordView()
    }
}
