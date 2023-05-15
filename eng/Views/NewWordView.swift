//
//  NewWordView.swift
//  eng
//
//  Created by Aleksandr Bogdanov on 05.05.2023.
//

import SwiftUI
import RealmSwift

struct NewWordView: View {
    
    @State var newWord = ""
    @State var wordTranslate = ""
    @State var showAlert = false
    @ObservedResults(WordItem.self) var wordItem
    @EnvironmentObject var listViewModel: ListViewModel

    var body: some View {
        VStack {
            HStack {
                Spacer()

                Text("New word")
                    .font(.system(size: 20, weight: .black))
                    .padding(.leading, 16)
                    .autocorrectionDisabled()

                Spacer()

                Button {
                    listViewModel.isShowAddView.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundColor(.black)
                }
            }
            .padding()
            VStack {
                HStack {
                    TextField("Add English word", text: $newWord)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width - 65, height: 80)
                        .background(
                            Rectangle()
                                .fill(Color.white)
                                .cornerRadius(10)
                                .shadow(color: .black, radius: 7))
                        .onAppear {
                            UITextField.appearance().clearButtonMode = .whileEditing
                        }
//                        .autocorrectionDisabled()
                }
                .padding()
                
                TextField("Add Russian word", text: $wordTranslate)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 65, height: 80)
                    .background(
                        Rectangle()
                            .fill(Color.white)
                            .cornerRadius(10)
                            .shadow(color: .black, radius: 7))
                    .onAppear {
                        UITextField.appearance().clearButtonMode = .whileEditing
                    }
//                    .autocorrectionDisabled()
            }

            Spacer()
            
            Button(action: {
                if newWord.count == 0 || wordTranslate.count == 0 {
                    showAlert.toggle()
                } else {
                    let word = WordItem()
                    word.mainWord = newWord
                    word.translateWord = wordTranslate

                    $wordItem.append(word)

                    withAnimation {
                        listViewModel.isShowAddView.toggle()
                    }
                }
                //
            }) {
                HStack {
                    Text("Save")
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                }
                .font(.headline)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(color: .black, radius: 5)
            }
            .alert(Text("Empty fields"), isPresented: $showAlert, actions: {})
            .buttonStyle(PlainButtonStyle())
            .padding(65)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(15)
        .background(.white)
    }
}

struct NewWordView_Previews: PreviewProvider {
    static var previews: some View {
        NewWordView()
    }
}
