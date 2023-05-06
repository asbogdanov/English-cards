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
        }) {
            HStack {
                Spacer(minLength: 50)

                Text("Next word")
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)

                Image(systemName: "arrowshape.right.fill")
                
                Spacer(minLength: 70)
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

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddButtonView()
    }
}
