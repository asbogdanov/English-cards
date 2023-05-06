//
//  NewWordView.swift
//  eng
//
//  Created by Aleksandr Bogdanov on 05.05.2023.
//

import SwiftUI

struct NewWordView: View {
    
    @State var newWord = ""
    @State var wordTranslate = ""

    var body: some View {
        VStack {
            HStack {
                Spacer()

                Text("New word")
                    .font(.system(size: 20, weight: .black))
                    .padding(.leading, 16)

                Spacer()

                Button {
                    //
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
                                .shadow(color: .black, radius: 10))
                        .onAppear {
                            UITextField.appearance().clearButtonMode = .whileEditing
                        }
                }
                .padding()
                
                TextField("Add Russian word", text: $wordTranslate)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 65, height: 80)
                    .background(
                        Rectangle()
                            .fill(Color.white)
                            .cornerRadius(10)
                            .shadow(color: .black, radius: 10))
                    .onAppear {
                        UITextField.appearance().clearButtonMode = .whileEditing
                    }
            }

            Spacer()
            
            Button(action: {
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
