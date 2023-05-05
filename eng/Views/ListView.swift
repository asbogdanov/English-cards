//
//  ListView.swift
//  eng
//
//  Created by Aleksandr Bogdanov on 05.05.2023.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    CardItem()
                    CardItem()
                    CardItem()
                    CardItem()
                    CardItem()
                    CardItem()
                    CardItem()
                }
                .padding(.vertical, 15)
                .padding(.horizontal, 20)
            }

            Button {
                //
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 56, height: 56)
                        .foregroundColor(Color(.lightGray))
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                }
                .offset(x: -20, y: -30)
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}

struct CardItem: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("English")
                .font(.system(size: 20, weight: .bold))

            Divider()

            Text("Русский")
                .font(.system(size: 20))
        }
        .padding(30)
        .background(
            Rectangle()
                .fill(Color.white)
                .cornerRadius(10)
                .shadow(color: .black, radius: 10))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
