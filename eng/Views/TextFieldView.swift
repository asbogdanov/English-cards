//
//  TextFieldView.swift
//  eng
//
//  Created by Aleksandr Bogdanov on 20.04.2023.
//

import SwiftUI

struct TextFieldView: View {
    @State var textFieldText: String = ""

    var body: some View {

        VStack {
            TextField("Enter English word here", text: $textFieldText)
                .padding()
                .frame(width: UIScreen.main.bounds.width - 65, height: 100)
                .background(
                    Rectangle()
                        .fill(Color.white)
                        .shadow(color: .black, radius: 6))

                .padding(.bottom, 40)

            TextField("Enter the translation here", text: $textFieldText)
                .padding()
                .frame(width: UIScreen.main.bounds.width - 65, height: 100)
                .background(
                    Rectangle()
                        .fill(Color.white)
                        .shadow(color: .black, radius: 6))
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}
