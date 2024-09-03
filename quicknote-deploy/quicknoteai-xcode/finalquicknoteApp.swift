//
//  QUICKNOTEAIApp.swift
//  QUICKNOTEAI
//
//  Created by Admin on 8/30/24.
//

import SwiftUI
import SwiftData
import BackgroundTasks

@main
struct QUICKNOTEAIApp: App {
    @StateObject private var backgroundTaskManager = BackgroundTaskManager()
    
    init() { // add init() in your main `App` class if you don't have one
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(backgroundTaskManager)
                .modelContainer(for: Recording.self)
        }
    }
    
}
