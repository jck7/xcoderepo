//
//  BackgroundTaskManager.swift
//  finalquicknote
//
//  Created by Admin on 9/1/24.
//


import BackgroundTasks
import SwiftUI

class BackgroundTaskManager: ObservableObject {
    static let shared = BackgroundTaskManager()
    
    // Change the initializer to internal or public
    init() {
        BGTaskScheduler.shared.register(forTaskWithIdentifier: "com.QuickNoteAI.backgroundtask", using: nil) { task in
            self.handleBackgroundTask(task: task as! BGProcessingTask)
        }
    }
    
    func scheduleBackgroundTask() {
        let request = BGProcessingTaskRequest(identifier: "com.yourapp.backgroundTask")
        request.requiresNetworkConnectivity = true
        request.requiresExternalPower = false

        do {
            try BGTaskScheduler.shared.submit(request)
        } catch {
            print("Could not schedule background task: \(error)")
        }
    }
    
    private func handleBackgroundTask(task: BGProcessingTask) {
        task.expirationHandler = {
            task.setTaskCompleted(success: false)
        }
        
        // Perform the background task
        performSummaryGeneration {
            task.setTaskCompleted(success: true)
        }
    }
    
    private func performSummaryGeneration(completion: @escaping () -> Void) {
        // Implement your summary generation logic here
        // Call completion() when done
        completion()
    }
}
