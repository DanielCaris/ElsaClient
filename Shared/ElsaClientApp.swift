//
//  ElsaClientApp.swift
//  Shared
//
//  Created by Daniel Caris on 03-03-22.
//

import SwiftUI

@main
struct ElsaClientApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(dictionaryWord: DictionaryWord.examples[0])
        }
    }
}
