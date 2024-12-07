//
//  OpenIMSDKExampleApp.swift
//  OpenIMSDKExample
//
//  Created by x on 11/25/24.
//

import SwiftUI
import OpenIMSDK

@main
struct OpenIMSDKExampleApp: App {
    init() {
        initSDK()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    func initSDK() {
        Task {
            do {
                var config = IMConfig()
                config.apiAddr = "http://172.16.8.135:10002"
                config.wsAddr = "ws://172.16.8.135:10001"
                config.platform = .iOs
                config.logLevel = .levelDebug
                config.dataDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path()
                
                let result = try await IMManager.connection.initSdk(config)
                
                print("\(#function) result: \(result)")
            } catch (let e) {
                if let error = e as? IMSDKError {
                    print("\(#function) throw an error: \(String(describing: error.message))")
                    
                    
                }
            }
        }
    }
}
