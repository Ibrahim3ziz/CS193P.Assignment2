//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Ibrahim Abdul Aziz on 02/12/2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            MemorizeView(gameViewModel: game)
        }
    }
}
