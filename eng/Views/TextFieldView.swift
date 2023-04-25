//
//  TextFieldView.swift
//  eng
//
//  Created by Aleksandr Bogdanov on 20.04.2023.
//

import SwiftUI

struct TextFieldView: View {
    @State var englishWordTestField: String = ""
    @State var translateWordTextField: String = ""

    var body: some View {

        VStack {
            TextField("Enter English word here", text: $englishWordTestField)
                .padding()
                .frame(width: UIScreen.main.bounds.width - 65, height: 100)
                .background(
                    Rectangle()
                        .fill(Color.white)
                        .cornerRadius(10)
                        .shadow(color: .black, radius: 10))
                .onAppear {
                    UITextField.appearance().clearButtonMode = .whileEditing
                }
                
                .padding(.bottom, 40)

            TextField("Enter the translation here", text: $translateWordTextField)
                .padding()
                .frame(width: UIScreen.main.bounds.width - 65, height: 100)
                .background(
                    Rectangle()
                        .fill(Color.white)
                        .cornerRadius(10)
                        .shadow(color: .black, radius: 10))
                .onAppear {
                    UITextField.appearance().clearButtonMode = .whileEditing
                }
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}
