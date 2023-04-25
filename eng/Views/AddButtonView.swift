//
//  AddButtonView.swift
//  eng
//
//  Created by Aleksandr Bogdanov on 21.04.2023.
//

import SwiftUI

struct AddButtonView: View {
    var body: some View {
        Button(action: {
            //action
        }, label: {
            Text("Add word")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(color: .black, radius: 5)
        })
        .buttonStyle(PlainButtonStyle())
        .padding(65)

    }
}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddButtonView()
    }
}
