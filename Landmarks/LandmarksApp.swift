//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Mostafa Kashwaa on 17/03/2021.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
