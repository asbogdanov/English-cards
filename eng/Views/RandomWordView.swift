//
//  RandomWordView.swift
//  eng
//
//  Created by Aleksandr Bogdanov on 05.05.2023.
//

import SwiftUI

struct RandomWordView: View {
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            VStack {
                Spacer()

                VStack {
                    Text("English")
                    Text("Русский")

                    ZStack {
                        Button {
                            //
                        } label: {
                            Text("Show translate")
                        }

                    }
                }

                Spacer()

                Button {
                    //
                } label: {
                    AddButtonView()
//                    Text("Next")
//                    Image(systemName: "chevron.right")
                }
                
            }
        }

    }
}

struct RandomWordView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
