//
//  petplatform_iOSApp.swift
//  petplatform-iOS
//
//  Created by haksung on 2022/11/21.
//

import SwiftUI

@main
struct petplatform_iOSApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
