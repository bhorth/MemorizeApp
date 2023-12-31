//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Brayden Horth on 2023-10-28.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
