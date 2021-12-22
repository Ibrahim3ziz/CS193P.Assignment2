//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Ibrahim Abdul Aziz on 02/12/2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGameVM()
    private let theme = EmojiMemoryGameVM.createMemoryGame(theme: emojiTheme)
    var body: some Scene {
        WindowGroup {
            MemorizeView(gameViewModel: game, theme: emojiTheme)
        }
    
    }
}
