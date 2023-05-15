//
//  RandomWordView.swift
//  eng
//
//  Created by Aleksandr Bogdanov on 05.05.2023.
//

import SwiftUI

struct RandomWordView: View {
    @State var isShowTranslate = false

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            VStack {
                Spacer()

                VStack {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("English")
                            .font(.system(size: 36, weight: .bold))
                        Text("Русский")
                            .font(.system(size: 30))
                            .opacity(isShowTranslate ? 1 : 0)
                    }

                    ZStack {
                        Button(action: {
                            withAnimation {
                                isShowTranslate.toggle()
                            }
                        }) {
                            HStack {
                                Spacer()

                                Text("Show translate")
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

                Button {
                    //
                } label: {
                    NextWordButtonView()
                }
            }
        }
    }
}

struct RandomWordView_Previews: PreviewProvider {
    static var previews: some View {
        RandomWordView()
    }
}
