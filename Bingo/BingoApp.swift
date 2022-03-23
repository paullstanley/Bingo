//
//  BingoApp.swift
//  Bingo
//
//  Created by Paull Stanley on 3/11/22.
//

import SwiftUI

@main
struct BingoApp: App {
    let game = BingoCardContent()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
