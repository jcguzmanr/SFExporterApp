//
//  SFExporterAppApp.swift
//  SFExporterApp
//
//  Created by jcguzmanr on 2/10/24.
//

import SwiftUI
import TipKit

@main
struct SFExporterAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    try? Tips.configure([
                        //For testing porpuses add this
                        .displayFrequency(.immediate),
                        .datastoreLocation(.applicationDefault)
                    ])
                }
        }
    }
}
