//
//  engApp.swift
//  eng
//
//  Created by Aleksandr Bogdanov on 19.04.2023.
//

import SwiftUI

@main
struct EngApp: App {
    var body: some Scene {
        let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)

        WindowGroup {
            RootView()
                .preferredColorScheme(.light)
        }
    }
}
