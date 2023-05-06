//
//  TranslateButtonView.swift
//  eng
//
//  Created by Aleksandr Bogdanov on 05.05.2023.
//

import SwiftUI

struct TranslateButtonView: View {
    var body: some View {
        Button(action: {
            //            isShowTranslate.toggle()
        }) {
            HStack {
                Text("Show translate")
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
}

struct TranslateButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TranslateButtonView()
    }
}
